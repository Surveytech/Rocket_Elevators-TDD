require 'uri'
require 'net/http'
require 'openssl'

class YahooFinanceController < ApplicationController
    
    def create
        url = URI("https://apidojo-yahoo-finance-v1.p.rapidapi.com/market/v2/get-quotes?region=US&symbols=AAPL")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = '2975dee3a1msh00aeed5496d9f26p1931c8jsn14ec53fcd3aa'
        request["x-rapidapi-host"] = 'apidojo-yahoo-finance-v1.p.rapidapi.com'

        response = http.request(request)
        puts response.read_body
    end

end
