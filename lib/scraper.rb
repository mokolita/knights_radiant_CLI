require 'nokogiri'
require 'open-uri'

class Scraper

    base_url = "https://coppermind.net/wiki/"

    order_url = base_url + "Knights_Radiant"
    surge_url = base_url + "Surgebinding"

    order_page = open(order_url)
    order_html = order_page.read
    
    surge_page = open(surge_url)
    surge_html = surge_page.read

    parsed_orders = Nokogiri::HTML(order_html)
    parsed_surges = Nokogiri::HTML(surge_html)   
   
    parsed_orders.css("dl")[0..9].each do |order_info|
        order_name = order_info.css("dt a").attr("title").text
        order_description = order_info.css("dd").text
        o = Orders.new(order_name, order_description)
     
    end  

    

        parsed_surges.css("h3 .mw-headline")[2..11].each do |surge|
            surge_name = surge.text
            @surge_name = surge_name
        end 

        parsed_surges.css("div.floatright ~p").split(/^[ \t]+/).each do |description|
            surge_description = description.text 
            @surge_description = surge_description
            binding.pry 
        end 

    def self.parsed_surge_attributes    
        s = Surge.new(@surge_name, @surge_description)
    end 
    
    
end 