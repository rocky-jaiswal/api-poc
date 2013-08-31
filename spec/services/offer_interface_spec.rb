require 'spec_helper'
require 'multi_json'

describe OfferInterface do
  
  it "should handle errors gracefully" do
    Net::HTTP.stub!(:get_response).and_raise

    i = OfferInterface.new
    resp = i.get_offers("q")
    MultiJson.load(resp)['message'].should == "Whoops .. an error has occured! Please try again later."
  end

end