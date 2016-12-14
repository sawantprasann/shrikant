class PostsController < ApplicationController
  layout "user"
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end
end
