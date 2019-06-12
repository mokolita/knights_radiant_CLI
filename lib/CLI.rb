require "pry"

class CLI 

    def run
        puts "\n\n\nWelcome! So you want to be a surgebinder?\n\n\n"
        
        input = gets.strip.downcase
        #binding.pry
        if input != "yes"
            puts "This is a life changing decision. If you would like one more chance to join the Knights Radiant, type yes! Otherwise, goodbye and good luck!"
            second_chance = gets.strip.downcase
            if second_chance == "yes"
                decision_time 
            end 
            #binding.pry
        else decision_time 
        end 
    
    end 
    #Should I save the attributes into an orders array and then call the array here?
    def decision_time
        puts "\n\nPick the attributes you value most:\n\n"

        Orders.attributes.each do |li|
            puts "\n\t -#{li}"
            #binding.pry
        end 
        #get user input here 
        input = gets.strip.downcase
         
        case input
            when input == "protection" || "leadership" 
                puts "Windrunner"
                #binding.pry
            when input == "law" || "justice"
                puts "Skybreaker"
              
        end 

        
    end 



end 