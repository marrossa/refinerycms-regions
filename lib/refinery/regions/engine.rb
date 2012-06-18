module Refinery
  module Regions
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Regions

      engine_name :refinery_regions

      initializer "register refinerycms_regions plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "regions"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.regions_admin_regions_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/regions/region',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Regions)
      end
    end
  end
end
