require 'nokogiri'
require 'open-uri'
require 'json'

$uri_naver = "https://www.naver.com"
$uri_daum = "https://www.daum.net"

class Real_time_searcher
    def naver
        @domain = $uri_naver
        @data_array = []

        document = Nokogiri::HTML(open(@domain))
        document.css(".ah_l").each do |deep|
            if deep["data-list"] == "1to10"
                deep.css(".ah_item").each do | data |
                    @data_array << {
                        rank: data.css('span.ah_r').text,
                        title: data.css('span.ah_k').text
                    } 
                end        
            end
        end
        return @data_array
    end

    def daum
        @domain = $uri_daum
        @data_array = []

        document = Nokogiri::HTML(open(@domain))
        document.css(".rank_cont").each do | data |
            if  data["class"] == "rank_cont" && data["aria-hidden"] != "true"
                @data_array << {
                    rank: data.css('.num_pctop span.ir_wa').text[0..-2],
                    title: data.css('.txt_issue a.link_issue').text
                }
            end
        end
        return @data_array
    end
end

def compare (real_time_one, real_time_two)
    def autovivifying_hash
        Hash.new {|ht,k| ht[k] = autovivifying_hash}
    end

    def create_table (search, naver, daum)
        if (naver == {})
            naver = "-"
        end
        if (daum == {})
            daum = "-"
        end
        puts "| #{search.ljust(20)} | #{naver.center(7)} | #{daum.center(6)} |"
    end
    
    real_time = autovivifying_hash

    real_time_one.each do | data |
        real_time[data[:title]][:naver] = data[:rank]
    end

    real_time_two.each do | data |
        real_time[data[:title]][:daum] = data[:rank]
    end

    create_table("검색어", "naver", "daum")
    real_time.keys.each do | data |
        create_table(data, real_time[data][:naver], real_time[data][:daum])
    end
end

real_time_searcher = Real_time_searcher.new
real_time_naver = real_time_searcher.naver
real_time_daum = real_time_searcher.daum

compare(real_time_naver, real_time_daum)