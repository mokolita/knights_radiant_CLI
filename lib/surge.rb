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
        if @description.include?("#{Orders.name}")
            @orders << Order 
            Orders.surges << self
        end
        binding.pry 
    end 

    def self.all 
        @@all
        #binding.pry
    end 
end 