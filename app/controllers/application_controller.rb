class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

    def set_picture
      @picture = Picture.find(params[:id])
    end


end
