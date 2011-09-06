require 'application'

class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter do |controller|
    
     # The first time the sitemap is created it will copy the 
     # the xml structure into a sesions object
     # The whole sitemap object could'nt be copied into the sessions because it contains
     # singleton method
     if session[:sitemap]  == nil       
        map = Sitemap.new(Application::SITEMAP_PATH)
        session[:sitemap] = map.to_string
     end
     
     # Get the xml as a string and build the sitempa object from it
     @sitemap = Sitemap.new(session[:sitemap], false)   
     
     # Get the menu id corresponding to the selected menu
     # If none are selected by default it will take the first
     # which is affaire 
     if params[:id] == nil
       
        session[:menuid] = @sitemap.id(@sitemap.first)
     else
       session[:menuid] = params[:id] 
     end
     
     # Get the top sitemap nodes. That are the one just bellow the root node.    
     @menus = @sitemap.top_elements 
     
     # Get the selected menu id
     @menu_id = session[:menuid]
  end
end
