class CommentsController < ApplicationController
    def new
        @comment = Comment.new
        @post = Post.find(params[:post_id])
        @user = current_user
    end
    
      def create
        @user = current_user
    @comment = @user.comments.build(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      flash[:success] = 'Comment created successfully!'
    else
      flash[:error] = 'Comment could not be saved.'
    end
    redirect_to user_post_path(current_user, @comment.post_id)
end
    
      def comment_params
        params.require(:comment).permit(:text)
      end
end
