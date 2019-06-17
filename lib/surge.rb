class Surge
    attr_accessor :name, :description
    @@all = []


    def initialize(name, description)
        @name = name 
        @description = description
        @@all << self
        @orders = []
    end 
   
    def self.all 
        @@all
    end 

    def orders
        @orders
    end 
end 