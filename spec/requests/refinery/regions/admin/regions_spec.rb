# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Regions" do
    describe "Admin" do
      describe "regions" do
        login_refinery_user

        describe "regions list" do
          before(:each) do
            FactoryGirl.create(:region, :name => "UniqueTitleOne")
            FactoryGirl.create(:region, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.regions_admin_regions_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.regions_admin_regions_path

            click_link "Add New Region"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Regions::Region.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Regions::Region.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:region, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.regions_admin_regions_path

              click_link "Add New Region"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Regions::Region.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:region, :name => "A name") }

          it "should succeed" do
            visit refinery.regions_admin_regions_path

            within ".actions" do
              click_link "Edit this region"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:region, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.regions_admin_regions_path

            click_link "Remove this region forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Regions::Region.count.should == 0
          end
        end

      end
    end
  end
end
