class ApplicationController < ActionController::Base
    before_action :authenticate_le!
  def home
  end
end
