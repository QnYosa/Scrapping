require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

def scrap_crypto_name (page)
    page.xpath('//tr/td[3]').each do |name|
    end 
end

def scrap_crypto_prices
    puts page.xpath('//tr/td[4]').each do |prices|
    end
end


def perform ()
scrap_crypto_name(page)
scrap_crypto_prices(page)
end 
perform(page)