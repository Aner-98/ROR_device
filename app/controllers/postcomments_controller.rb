class PostcommentsController < ApplicationController
before_action :authenticate_user!

  def create
  	params[:postcomment][:post_id]=params[:post_id]
  	params[:postcomment][:user_id]=current_user.id
  	@comment = Postcomment.create(comment_params)
  	if @comment.save
      redirect_to post_path(params[:post_id])
    else
      @comment.errors.full_messages.each do |msg|
        @msg = msg
      end
      flash[:notice] = "#{@msg}"
      redirect_to post_path(params[:post_id])
    end
  end


# def destroy
#   params[:postcomment][:post_id]=params[:post_id]
#   @postcomment.destroy
# end

private
	
	def comment_params
		params.require(:postcomment).permit(:post_id, :user_id, :comment)
	end



end
