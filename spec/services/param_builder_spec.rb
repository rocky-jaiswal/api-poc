require 'spec_helper'

describe ParamBuilder do
  
  it "should merge user params properly" do
    builder = ParamBuilder.new
    params = {:page => 1, :no_of_params => 2, :pub0 => "a", :pub1 => "b"}
    builder.merge_user_params params
    builder.req_params[:pub0].should == "a"
    builder.req_params[:pub1].should == "b"
    builder.req_params[:page].should == 1
  end

  it "should add a hash key" do
    builder = ParamBuilder.new
    builder.add_hash_key("a=1&b=2&").include?("a=1&b=2&hashkey=").should == true
  end

  it "should build the params correctly" do
    builder = ParamBuilder.new
    params = {:page => 1, :no_of_params => 2, :pub0 => "a", :pub1 => "b"}
    q = builder.build_params(params, "01")
    q.include?("appid").should == true
    q.include?("locale").should == true
    q.include?("device_id").should == true
    q.include?("timestamp").should == true
    q.include?("hashkey").should == true
  end

end