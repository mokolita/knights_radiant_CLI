class Surge
    attr_accessor :name, :description
    @@all = []


    def initialize(name, description)
        @name = name 
        @description = description
        @@all << self
        @orders = []
    end 

    def orders
        #I need to assign the surge to an instance of order that it relates to. 
    
    end 

    def self.all 
        @@all
        #binding.pry
    end 
end 