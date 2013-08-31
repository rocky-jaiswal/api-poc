require 'spec_helper'

describe PagesHelper do
  
  it "should return the correct class for offers" do
    offers1 = nil
    offers2 = []
    offers3 = ["o1"]
    helper.get_offer_class(offers1).should == "no_offers"
    helper.get_offer_class(offers2).should == "no_offers"
    helper.get_offer_class(offers3).should == "offers"
  end

  it "should build the offers ui" do
    offers = [{'title' => "Tap Fish", 'payout' => "25", 'thumbnail' => {'lowres' => 'aa'}}, {'title' => "Tap Fish2", 'payout' => "55", 'thumbnail' => {'lowres' => 'bb'}}]
    helper.build_offers_ui(offers).should_not be nil
  end
  
end
