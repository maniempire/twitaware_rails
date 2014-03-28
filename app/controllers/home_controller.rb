class HomeController < ApplicationController
  def index
    
   search_results(params[:search_tag])
    
  end
  
  def tweet_classification
    
    tag = params[:tweet_filter_for]
    
    tag = "flood" if tag.blank?
    
    @filtered_tweets = filter_tweets(tag)
    
    params[:tweet_filter_for] = tag
    
  end
  
  def tweet_based_on_regions
    
    # @search_results = Twitter.search("-RT -election power OR #sandy OR #frankenstorm OR sandy OR flood OR surge geocode:40.714353,-74.00597299999998,20km").results 
    # @search_results = Twitter.search("-RT #sandy OR #frankenstorm OR sandy OR flood OR surge geocode:40.714353,-74.00597299999998,20km").results
    #lang:en
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
    
     @search_results = Twitter.search("#{key_word} -filter:retweets lang:en").results 
     
     
    
  end 
  
  def filter_tweets(key_word)
    tweet_str_array = []
     good_tweet_array = []
      bad_tweet_array = []
      
      results = Twitter.search("#{key_word} -filter:retweets lang:en").results
      
      unless results.blank? 
    
     results.each do |tweet|
       
       tweet_text = tweet.text.downcase()

      if key_word == "flood"
        if tweet_text.include? "claims" or tweet_text.include? "water" or tweet_text.include? "raindrop" or tweet_text.include? "warning" or tweet_text.include? "bad" or tweet_text.include? "river" or tweet_text.include? "flooding" or tweet_text.include? "mitigation"
         puts "in good tweet"
         good_tweet_array.push(tweet)
         
         else
            puts "in bad tweet"
            bad_tweet_array.push(tweet)
          end
      
      elsif key_word == "accident"
        # Accident, collision, crash, breakdown, damage, event, people, died, injured, grief, tragedy, emergency, incident.
        if tweet_text.include? "accident" or tweet_text.include? "collision" or tweet_text.include? "crash" or tweet_text.include? "breakdown" or tweet_text.include? "damage" or tweet_text.include? "died" or tweet_text.include? "injured" or tweet_text.include? "incident"
          puts "in good tweet"
           good_tweet_array.push(tweet)
       else
         puts "in bad tweet"
         bad_tweet_array.push(tweet)
       end
       
      elsif key_word == "wildfires"
        # Accident, collision, crash, breakdown, damage, event, people, died, injured, grief, tragedy, emergency, incident.
        if tweet_text.include? "wildfires" or tweet_text.include? "collision" or tweet_text.include? "crash" or tweet_text.include? "breakdown" or tweet_text.include? "damage" or tweet_text.include? "died" or tweet_text.include? "injured" or tweet_text.include? "incident"
          puts "in good tweet"
           good_tweet_array.push(tweet)
       else
         puts "in bad tweet"
         bad_tweet_array.push(tweet)
       end
        
     else
       
       puts "no key word found for search"
       
     end
      # tweet_str_array = processTweet(tweet)
        
     end
     
   end
     
     @search_results = good_tweet_array
    
  end
  
  #start process_tweet
  def processTweet(tweet)
    good_tweet_array = []
    bad_tweet_array = []
    
      # process the tweets
      # Flood, seawaves, overflow, tide, rush, excess, water, downrush, rain, plenty.
      #Convert to lower case
        
      #Convert www.* or https?://* to URL
      # tweet = tweet.gsub('((www\.[\s]+)|(https?://[^\s]+))','URL')
      #Convert @username to AT_USER
      # tweet = tweet.gsub('@[^\s]+','AT_USER')
      #Remove additional white spaces
      # tweet = tweet.gsub('[\s]+', ' ')
      #Replace #word with word
      # tweet = tweet.sub(r'#([^\s]+)', r'\1')
      #trim
      # tweet = tweet.strip
      return good_tweet_array, bad_tweet_array
  end
   
  
end
