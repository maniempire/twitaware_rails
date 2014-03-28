module HomeHelper

  def tweet_display(tweet_results)

    html = ''

    if !tweet_results.blank?
      
      tweet_results.each do |t|

        html << "<tr><td valign=\"top\"><a href=\"http://twitter.com/#{t.user.screen_name}\" target=\"_blank\">#{t.user.name}</a>: #{auto_link(t.text)}</td></tr>"

      end
      
    end

    return html.html_safe
    
  end


end
