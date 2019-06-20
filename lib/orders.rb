class Orders
    attr_accessor :name, :description, :info_url
    @@attributes = {:windrunners => "Protection or Leadership", :skybreakers => "Law or Justice", :dustbringers => "Power or Destruction", :edgedancers => "Food or Cultivation", :truthwatchers => "Healing or Truth", :lightweaver => "Lies or Craftiness", :elsecallers => "Knowledge or Travel", :willshapers => "Control or Progress", :stonewards => "Strength or Security", :bondsmiths => "Reconciliation or Authority"}
    @@all = []
    def initialize(name, description, info_url)
        @name = name
        @description = description
        @info_url = info_url
        @@all << self
        @surges = [] 
    end 


    def surges
        a = self.description.scan(/(?<=Surges of )(.*)(?=\[12])/)
        b = a.to_s.split(" ")
        Surge.all.select do |surge_instance|
            if b[0].gsub("[[\"", '') == surge_instance.name
                @surges << surge_instance 
                surge_instance.orders << self 
            end
        end 
        Surge.all.select do |surge_instance|
            if b[2].gsub(".\"]]", '') == surge_instance.name 
                @surges << surge_instance
                surge_instance.orders << self
            end 
        end 
        @surges 
    end
    
    def self.attributes  
        @@attributes
    end 

    def self.all
        @@all
    end 
end 