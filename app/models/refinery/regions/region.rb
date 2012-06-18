module Refinery
  module Regions
    class Region < Refinery::Core::BaseModel
      self.table_name = 'refinery_regions'      
    
      acts_as_indexed :fields => [:name]

      attr_accessible :name, :position

      validates :name, :presence => true, :uniqueness => true
              
    end
  end
end
