require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

def name_(page) 
    arr_crypto_name = page.xpath('//tr/td[3]')
  # lister dans un array toutes les valeurs trouvée dans la 3e colonne (symbol) du tableau HTML
  return arr_crypto_name
end    

def price_list(page)
    value_crypto = page.xpath('//tr/td[4]')
    #lister dans un array toutes les valeurs trouvée dans la 5e colonnes(price) du tableau HTML

    value_crypto_s_f = value_crypto.map { |price| price.to_s.delete("$").to_f}
    #transformer cette valeur en string pour pouvoir retirer le '$' puis la reconvertir en float
    return value_crypto_s_f
end

def currency_cours(page)
    c_name = name_(page)
    c_value = price_list(page)
    final_crypto = []# créer un array vide qui va accueillir les hashes de noms/prix
    # pour chaque element de la liste, on crée un hash {nom monnaie => valeur monnaie} puis on l'insère dans notre array

        for i in 0...c_name.size
        final_crypto << {c_name[i] => vc_value[i]}
        end 
    return final_crypto
end
    
currency_cours(page)
