require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def ini_page(page_url)
    page_mairie = Nokogiri::HTML(open(page_url))
end 

def city_list #okay 
    our_page = ini_page("http://annuaire-des-mairies.com/val-d-oise.html")
    cities = []

    our_page.xpath('//*[@class="lientxt"]').each do |villes|
    cities << villes.text #okay 
    end
    return cities
end

def email_collect(city)
    mails_mairies = ini_page("http://annuaire-des-mairies.com/95/#{city}.html")
    mails_mairies.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |mails|
    return mails.text 
    end
end

def arr_twon_mail()
    our_page = ini_page("http://annuaire-des-mairies.com/val-d-oise.html")
    final_array = []
    our_page.xpath('//*[@class="lientxt"]').each do |city|
        result << { "#{city.text}" => email_collect(city.text.downcase.gsub(' ','-')) }
        end
    return result
end 

def perform
    puts arr_twon_mail()
end 

perform
