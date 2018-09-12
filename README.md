# Real-Time Query
## RUBY Parser
### Purpose
1. Understand Ruby process.
2. ... Ruby concepts.
2. Using Nokogiri.

### Technical Stack
* Ruby
* Nokogiri


## Implement
### **class** Real_time_searcher
A class that parses real-time queries.
```ruby
class Real_time_searcher
    def naver
        # naver parsing
    end

    def daum
        # daum parsing
    end
end
```

### **function** compare
Compare data from different domains.
```ruby
def compare (real_time_one, real_time_two)
    def autovivifying_hash
        # Nested hash
    end

    def create_table (search, naver, daum)
        # Print
    end
    
    # Compare Logic
    real_time = autovivifying_hash

    real_time_one.each do | data |
        real_time[data[:title]][:naver] = data[:rank]
    end

    real_time_two.each do | data |
        real_time[data[:title]][:daum] = data[:rank]
    end
end
```


## Result
### Real-Time Query
검색어 | naver | daum
--- | --- | ---
김인태 | 1 | 1 
백수련 | 2 | 4 
82년생 김지영 | 3 | 3 
김수현 | 4 | 8
정유미 | 5 | 5
녹십자셀 | 6 | 2
김새론 | 7 | - 
물괴 | 8 | 6
탕웨이 | 9 | 9
여상규 | 10 | 4 
하나뿐인 내편 | - | 7 |
신보라 | - | 10 |

## Histories
    2018.09.11. Real-Time Parser