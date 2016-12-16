class PostsController < ApplicationController
  layout "user"
  def index
  	@posts = Post.all
  	@comment = Comment.new
  end

  def show
  	@post = Post.find(params[:id])
  	@comments = @post.comments.order('created_at desc')
  end
end
