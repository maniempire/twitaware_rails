class PostController < ApplicationController
  def index
      test_search
     @tweets = Twitter.user_timeline("maniempire")
     # @tweets = Twitter.search("ruby")
       respond_to do |format|
       format.html # index.html.erb
       # format.json { render :json =&gt; @posts }
       
     end
    
  end
  
  def twitter_login
   omniauth = request.env['omniauth.auth']   # This contains all the details of the user say Email, Name, Age so that you can store it in your application db.
      redirect_to "post/index"
    end
  
  def test_search
    puts "In test search"
    topics = ["Daily", "Stories"]
    
   result = Twitter.search('earthquake').results 
   
   
    result.each do |tweet|
          puts tweet.text
    end
   
   # puts obj
   
   
   
   # Twitter.search("ruby", :result_type => "recent").search.each do |tweet|
   #      puts tweet.text
   #    end
   
   # obj.each do |ob|
   #     puts ob #if obj.is_a?(Twitter::Tweet)
   #   end
    
    # puts object
    # Twitter.filter(:track => topics.join(",")) do |object|
      # puts object.text if object.is_a?(Twitter::Tweet)
    # end
    
  end
    
  
  def test_tweet
    puts "In test tweet"
    Twitter.user do |object|
      case object
      when Twitter::Tweet
        puts "It's a tweet!"
      when Twitter::DirectMessage
        puts "It's a direct message!"
      when Twitter::Streaming::StallWarning
        warn "Falling behind!"
      end
    end
    
  end
end
