require "pry"

class CLI 

    def run
        puts "\n\n\nWelcome! You would like to be a surgebinder, yes?\n\n\n"
        
        input = gets.strip.downcase
        if input != "yes"
            puts "If you would like one more chance to become a Knights Radiant, type yes! Otherwise, goodbye and good luck!"
            second_chance = gets.strip.downcase
            if second_chance == "yes"
                decision_time 
                provide_surge_info
            end 
        else 
            decision_time 
            provide_surge_info
        end 
        
    end 

    def decision_time
        puts "\n\nTo start the process you must swear the first ideal:"
        Scraper.order_initialize
        Scraper.second_level
        puts "\n\n#{Scraper.second_level.colorize(:green)}"
        puts "\n\nNow, pick the attribute you value most:\n\n"
        
        Orders.attributes.values.each do |li|
            puts "\n\t -#{li.colorize(:green)}\n\n"
        end
         
        order_assignment 
    end 

    def order_assignment 
        input = gets.strip.downcase
            if input == "exit" || input == "no"
                exit
            end  

        @response = nil 
        Scraper.surge_initialize
        case input  
            when "protection", "leadership" 
                puts "\n\n\ You are #{Orders.all[0].name}!".colorize(:green)
                puts "\n\n Here is some more info on your order: \n\n#{Orders.all[0].description.colorize(:green)}"
                @response = Orders.all[0].surges 
            when "law", "justice"
                puts "\n\n\ You are #{Orders.all[1].name}!".colorize(:green) 
                puts "\n\n Here is some more info on your order: \n\n#{Orders.all[1].description.colorize(:green)}"
                @response = Orders.all[1].surges 
            when "power", "destruction"
                puts "\n\n\ You are #{Orders.all[2].name}!".colorize(:green)
                puts "\n\n Here is some more info on your order: \n\n#{Orders.all[2].description.colorize(:green)}"
                @response = Orders.all[2].surges 
            when "food", "cultivation"
                puts "\n\n\ You are #{Orders.all[3].name}!".colorize(:green)
                puts "\n\n Here is some more info on your order: \n\n#{Orders.all[3].description.colorize(:green)}"
                @response = Orders.all[3].surges 
            when "healing", "truth"
                puts "\n\n\ You are #{Orders.all[4].name}!".colorize(:green)
                puts "\n\n Here is some more info on your order: \n\n#{Orders.all[4].description.colorize(:green)}"
                @response = Orders.all[4].surges 
            when "lies", "craftiness"
                puts "\n\n\ You are #{Orders.all[5].name}!".colorize(:green)
                puts "\n\n Here is some more info on your order: \n\n#{Orders.all[5].description.colorize(:green)}"
                @response = Orders.all[5].surges 
            when "knowledge", "travel"
                puts "\n\n\ You are #{Orders.all[6].name}!".colorize(:green)
                puts "\n\n Here is some more info on your order: \n\n#{Orders.all[6].description.colorize(:green)}"
                @response = Orders.all[6].surges 
            when "control", "progress"
                puts "\n\n\ You are #{Orders.all[7].name}!".colorize(:green)
                puts "\n\n Here is some more info on your order: \n\n#{Orders.all[7].description.colorize(:green)}"
                @response = Orders.all[7].surges 
            when "strength", "security"
                puts "\n\n\ You are #{Orders.all[8].name}!".colorize(:green) 
                puts "\n\n Here is some more info on your order: \n\n#{Orders.all[8].description.colorize(:green)}"
                @response = Orders.all[8].surges 
            when "reconciliation", "authority"
                puts "\n\n\ You are #{Orders.all[9].name}!".colorize(:green)
                puts "\n\n Here is some more info on your order: \n\n#{Orders.all[9].description.colorize(:green)}"
                @response = Orders.all[9].surges 
            else 
                puts "\n\nSo sorry! What attribute did you pick?\n\n"
                order_assignment 

        end 

        
    end 

    def provide_surge_info
        puts "\n\nWould you like more info on your surges?\n\n"
        input = gets.strip.downcase  
        if input != "yes"
            puts "\n\nPut yes if you want to see more info. Otherwise, Goodbye and good luck!\n\n\n".colorize(:green)
            input = gets.strip.downcase    
            if input != "yes"
                   puts "\n\nGoodbye and good luck!\n\n\n".colorize(:green)
                   exit
            else 
                  surge_info
                end 
        else 
            surge_info
        end 
        puts "Good luck in the fight against the desolation, Surgebinder!\n\n\n".colorize(:green)
    end 
    
    def surge_info
        puts "\n\n-#{@response[0].name.colorize(:light_blue)}\n\n"
        puts "#{@response[0].description.colorize(:light_blue)}\n\n"
        puts "-#{@response[1].name.colorize(:light_blue)}\n\n"
        puts "#{@response[1].description.colorize(:light_blue)}\n\n"
    end 
end 