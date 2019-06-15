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
        Surge.all.description.scan("#{Orders.all.name}") do |order|
            @orders << order  
        end
        binding.pry 
    end 

    def self.all 
        @@all
        #binding.pry
    end 
end 