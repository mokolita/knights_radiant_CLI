class Orders
    attr_accessor :name, :description
    @@attributes = ["Protection & Leadhership", "Law & Justice", "Power & Disctruction", "Food & Cultivation", "Healing & Truth", "Lies & Craftiness", "Knowledge & Travel", "Control & Progress", "Strength & Security", "Reconciliation & Authority"]
    
    def surges
        #iterate through the surges.all array and assign the correct surges to the instance of the order. 

        Surges.all.collect do |surge|
             surge.order == self 
        end 
    end
    
    def self.attributes 
        @@attributes
    end 
end 


#I want to be able to collect it into an array and then use that array later to put out the info on the instances of surge assigned to that order
#how to assign attribute list to orders?
#Is attribute listthe best way to do this? Since it can not be scraped? If not attributes, then random generator?  don't like the idea of a random generateor. 
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