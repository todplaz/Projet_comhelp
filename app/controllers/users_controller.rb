class UsersController < ApplicationController

  helper_method :user_is_allowed_to_vote?
  
  def show
  if User.exists?(params[:id])
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end


  def upvote
    @user = User.find(params[:id])
    @user.upvote_from current_user
		respond_to do |format|
       format.html { redirect_to user_path(@user.id) }
       format.js { }
	      end
  end

  def downvote
    @user = User.find(params[:id])
    @user.downvote_from current_user
  	    respond_to do |format|
       format.html { redirect_to user_path(@user.id) }
       format.js { }
        end
  end

  private

	def user_is_allowed_to_vote?
		current_user.answered_posts.where(user:@user).present? || @user.answered_posts.where(user:current_user).present?
	end

end
