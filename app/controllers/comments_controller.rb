class CommentsController < ApplicationController
    def create
        post = Post.find(params[:post_id])
        @comment = post.comments.build(comment_params)
        @comment.save
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
        @comment.destroy
        redirect_back(fallback_location: root_path)
    end

    private    
        def comment_params
            params.require(:comment).permit(:content)
        end
end
