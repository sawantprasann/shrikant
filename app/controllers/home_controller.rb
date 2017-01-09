class HomeController < ApplicationController
	layout "user"
  def index
    @posts = Post.all
  end

  def about
  	
  end

  def post
  	
  end
  def contact
  	
  end

  def gallery
    
  end
end
