require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

page_mairie = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))

def city_list #okay 
    cities = []
    page_mairie = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))

    page_mairie.xpath('//*[@class="lientxt"]').each do |villes|
    cities << villes.text #okay 
    end 
        cities.each do|city|
            if city.include?" "
            city.gsub!(/ /, "-")
            end #okay 
        end
    puts cities
end


def href_collect 
    #url = []
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    url = page.xpath('//a[@class="lientxt"]/@href')
    url.each do |path|
        if path.include?"."
            path.delete_prefix!(".")
        end 
    end 
puts url 
end 

def get_townhall_email(url) #okay
    page_townhall = Nokogiri::HTML(open(url))
    page_townhall.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |mails|
    puts mails.text 
    end  
 end

 
 #get_townhall_email('http://annuaire-des-mairies.com/95/avernes.html')
city_list
