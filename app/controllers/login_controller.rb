class LoginController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    
  end
  
  def validate_user
    
    puts "In validate user"
    
    redirect_to "/home/index?search_tag=flood"
    
  end
  
  
end
