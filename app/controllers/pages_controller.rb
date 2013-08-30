class PagesController < ApplicationController

  def login
    redirect_to home_path if user_signed_in?
  end
  
  def home
  end

  def offers
    if !params[:pub0] || !params[:page]
      render :json => {:message => "page and pub0 are required"} and return
    else
      render :json => {:message => "ok"} and return
    end
  end

end
