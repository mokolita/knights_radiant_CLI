require 'nokogiri'
require 'open-uri'
require_relative "./surge"

class Scraper

    BASE_URL = "https://coppermind.net" 
   
    def self.order_initialize
        order_url = BASE_URL + "/wiki/Knights_Radiant"
        order_page = open(order_url)
        order_html = order_page.read
        parsed_orders = Nokogiri::HTML(order_html)
        parsed_orders.css("dl")[0..9].each do |order_info|
        order_name = order_info.css("dt a").attr("title").text
        order_description = order_info.css("dd").text
        more_info_url = order_info.css("dt a").attr("href").text
        @o = Orders.new(order_name, order_description, more_info_url) 
    end 
end  

   def self.surge_initialize 
        surge_url = BASE_URL + "/wiki/Surgebinding"
        surge_page = open(surge_url)
        surge_html = surge_page.read
        parsed_surges = Nokogiri::HTML(surge_html)
        surge_name = parsed_surges.css("h3 .mw-headline")[2..11].text.split(/(?=[A-Z])/)
        surge_description = parsed_surges.css("h3 ~div.floatright ~p")[0..-3].text.split(/\n/).reject!(&:empty?)
        surge_hash = Hash[surge_name.zip(surge_description)]
        surge_hash.each_pair {|k, v| Surge.new(k, v)}
   end 

   def self.second_level
        second_level_url = BASE_URL + @o.info_url
        second_level_page = open(second_level_url)
        second_level_html = second_level_page.read
        parsed_second_level = Nokogiri::HTML(second_level_html)
        ideal_name = parsed_second_level.css("h3 .mw-headline").first.text
        ideal_words = parsed_second_level.css("blockquote em").first.text.strip
    end 


end 


