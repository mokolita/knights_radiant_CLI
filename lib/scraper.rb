require 'nokogiri'
require 'open-uri'
require_relative "./surge"

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

        parsed_surges.css("h3")[2..11].each do |surge|
            @surge_name = surge.css(".mw-headline").text
        end 
                
        parsed_surges.css("h3 ~div.floatright ~p")[0..-3].text.split(/\n/).reject!(&:empty?).each do |surge|
            @surge_description = surge 
        end    
        
    def self.parsed_surge_attributes
        
        s = Surge.new(@surge_name, @surge_description)

        puts Surge.order 
        #s.orders = "the order it belongs to."
    end 
    
    
end 