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
        #binding.pry
        #@description.scan() do |o|
            #@orders << o  
        #end
         #binding.pry
    end 

    def self.all 
        @@all
        #binding.pry
    end 

    def orders
        order 
        @orders
    end 
end 