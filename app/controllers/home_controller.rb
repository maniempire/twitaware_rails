class HomeController < ApplicationController
  def index
    
    # params[:search_word] = "ruby"
    
    puts "in Index method"
    
   search_results(params[:search_tag])
    
    
    
  end
  
  def tweet_classification
    
  end
  
  def tweet_based_on_regions
    
    # @search_results = Twitter.search("-RT -election power OR #sandy OR #frankenstorm OR sandy OR flood OR surge geocode:40.714353,-74.00597299999998,20km").results 
    # @search_results = Twitter.search("-RT #sandy OR #frankenstorm OR sandy OR flood OR surge geocode:40.714353,-74.00597299999998,20km").results
    
    @japan_earthquake_results = Twitter.search("-RT #earthquake geocode:36.2050000,138.2530000,100km").results
    
    @newyork_sandy_results = Twitter.search("-RT #sandy OR #frankenstorm OR sandy OR flood OR surge geocode:40.714353,-74.00597299999998,20km").results
    # malaria geocode:53.81982,-2.406348,500km
  
    
    @uk_malaria_results = Twitter.search("-RT malaria geocode:53.81982,-2.406348,500km").results
    
   
    @india_polio_results = Twitter.search("-RT polio geocode:21.0000000,79.0000000,1000km").results
    
  end
  
  
  def search_tag
    
    tag = params[:search_key_word]
    
    redirect_to "/home/index?search_tag=#{tag}"
    
  end
  
  
  def search_results(key_word)
    
     @search_results = Twitter.search("#{key_word} -filter:retweets").results 
    
  end  
  
end
