class Surge
    attr_accessor :name, :description
    @@all = []


    def initialize(name, description)
        @name = name 
        @description = description
        @@all << self
        @orders = []
    end 

    def order
        binding.pry
        Surge.all.description.scan("#{Orders.all.name}") do |o|
            @orders << o  
        end
         
    end 

    def self.all 
        @@all
        #binding.pry
    end 

    def orders
        @orders
    end 
end 