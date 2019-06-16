class Orders
    attr_accessor :name, :description
    @@attributes = {:windrunners => "Protection or Leadership", :skybreakers => "Law or Justice", :dustbringers => "Power or Destruction", :edgedancers => "Food or Cultivation", :truthwatchers => "Healing or Truth", :lightweaver => "Lies or Craftiness", :elsecallers => "Knowledge or Travel", :willshapers => "Control or Progress", :stonewards => "Strength or Security", :bondsmiths => "Reconciliation or Authority"}
    @@all = []
    def initialize(name, description)
        @name = name
        @description = description
        @@all << self
        @surges = [] 
    end 


    def surges
        a = self.description.scan(/(?<=Surges of )(.*)(?=\[12])/)
        b = a.to_s.split(" ")

        Surge.all.each do |name|
           if b[0].gsub("[[\"", '') || b[2].gsub(".\"]]", '') == Surge.name
                @surges << name 
                #Surge.orders << self 
           end
        end 
        @surges 
        binding.pry
    end
    
    def self.attributes  
        @@attributes
    end 

    def self.all
        @@all
    end 
end 


#Attribute List
    #Windrunner - protection & leadership
    #Skybreakers - law & justice
    #Dustbringers = power & distruction
    #Edgedancer = food & cultivation
    #Truthwatchers - healing & truth
    #Lightweavers = lies & craftiness
    #Elsecallers = knowledge & travel
    #Willshapers = control & progress
    #Stonewards - strength & security
    #bondsmith - reconciliation - authority