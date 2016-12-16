class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		if current_user
			@comment = @post.comments.new(comment_params)
			@comment.user_id = current_user.id
		    @comment.save!
		end   
		
	end

	def comment_params
		params.require(:comment).permit(:content,:user_id)
	end
end
