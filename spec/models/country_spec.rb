require 'spec_helper'

describe Country do
  describe "given two Countries saved to our DB" do
    before do
      @options = {name: "Worldwide", woeid: 1}
      country1 = Country.create(@options)
      country2 = Country.create(@options)
    end
      it "should have the country saved and return the right values" do
        @countries = Country.all
        @countries.count.should == 2
        @countries.each do |country|
          country.name.should == @options[:name]
          country.woeid.should == @options[:woeid]
        end
      end
    end
  end
end
