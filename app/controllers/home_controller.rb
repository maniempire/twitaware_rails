class HomeController < ApplicationController
  def index
    
    # params[:search_word] = "ruby"
    
    puts "in Index method"
    
   search_results(params[:search_tag])
    
    
    
  end
  
  
  def search_tag
    
    tag = params[:search_key_word]
    
    redirect_to "/home/index?search_tag=#{tag}"
    
  end
  
  
  def search_results(key_word)
    
     @search_results = Twitter.search("#{key_word} -filter:retweets").results 
    
  end  
  
end
