class CreateRegionsRegions < ActiveRecord::Migration

  def up
    create_table :refinery_regions do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-regions"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/regions/regions"})
    end

    drop_table :refinery_regions

  end

end
