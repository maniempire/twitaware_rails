class RegistrationsController < Devise::RegistrationsController
  
  def new
    build_resource resource
  end

  def create
    # super
    
    build_resource sign_up_params
    
    if resource.save
          redirect_to "/users/sign_in", :notice=> "You have successfully signed up. Please login with your credentials."
       else
          redirect_to "/users/sign_up", :notice=> "Invalid signup details."
       end
    
    # redirect_to "/home/index", :notice=> "You are successfully signed up."
    
  end
end
