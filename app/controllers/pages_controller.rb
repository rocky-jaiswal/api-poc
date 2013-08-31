require 'multi_json'

class PagesController < ApplicationController

  def login
    redirect_to home_path if user_signed_in?
  end
  
  def home
  end

  def offers
    if params[:pub0].nil? || params[:page].nil? || params[:pub0].blank? || params[:page].blank?
      @response = {'message' => "Page Size and atleast one User Param is required."}
    else
      @response = MultiJson.load(get_offers(params))
    end
    render :partial => "response"
  end

  private
  def get_offers(params)
    builder = ParamBuilder.new
    offer_interface = OfferInterface.new
    query_string = builder.build_params(params, current_user.id)
    offer_interface.get_offers(query_string)
  end

end
