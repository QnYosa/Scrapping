require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

def name_ 
    name_crypto = []
    @page.xpath('//tr/td[3]').each do |crypto|
        name_crypto << crypto.text #work
        end    

    value_crypto = []
    @page.xpath('//tr/td[4]').each do |values|
    value_crypto << values.text.to_s.delete("$").to_f
    end
    final_crypto = []
for i in 0...name_crypto.size
    final_crypto << {name_crypto[i] => value_crypto[i]}
end
    #hash_cryptos = Hash.new
    #hash_cryptos = Hash[name_crypto.zip value_crypto] #work

    #final_crypto = []
    return puts final_crypto 
end

perform()
