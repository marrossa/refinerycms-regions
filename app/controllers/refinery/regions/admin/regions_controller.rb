module Refinery
  module Regions
    module Admin
      class RegionsController < ::Refinery::AdminController

        crudify :'refinery/regions/region',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
