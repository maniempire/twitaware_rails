class SessionsController < Devise::SessionsController
  
  def new
    
    puts "in signin"
    
    self.resource = resource_class.new(sign_in_params)
        clean_up_passwords(resource)
        respond_with(resource, serialize_options(resource))
    
  end
  
  def create 
    self.resource = warden.authenticate!(:scope=>:user)
     # set_flash_message(:notice, :signed_in) if is_navigational_format?
     sign_in(resource_name, self.resource)  
   
       respond_with resource, :location => after_sign_in_path_for(self.resource)
  end
  
  def destroy

    reset_session

    redirect_to "/users/sign_in", :flash => { :info =>  "You have now logged out..!" }

  end
  
end
