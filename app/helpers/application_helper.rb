module ApplicationHelper

  def select_tag_for_filter(member, nvpairs, params)
    options = { :query => params[:query] }
    _url = url_for(eval("#{member}_url(options)"))
    _html = %{%label(for='show') Show:}
    _html << %{%select :name=>"show" :id=>"show"}
    _html << %{onchange="window.location='#{_url}' + '?show=' + this.value">}
    nvpairs.each do |pair|
      _html << %{%option(value='#{pair[:scope]}')}
      if params[:show] == pair[:scope] || ((params[:show].nil? || 
  params[:show].empty?) && pair[:scope] == "all")
      _html << %{ selected="selected"}
      end
      _html << %{#{pair[:label]}}
    end
  end

 def youtube_video(profilevid)
   if profilevid
     profilevid="http://www.youtube.com/embed/_O7iUiftbKU?feature=player_detailpage"
     render :partial => 'shared/video'
   else
     render :partial => 'shared/video'
   end
 end 

private
def current_member
  @current_member ||= User.find(session[:member_id]) if session[:member_id]
end

end
