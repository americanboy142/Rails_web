class LikesYouController < ApplicationController
  #before_action :current_test_post
  before_action :authenticate_user!

  def create
    #user = current_user
    #user.update_without_password(:likes => current_user.likes + "," + likes_you_params[:user_id].to_s)
    liked_user = User.find(likes_you_params[:test_post_id])
    like = current_user.likes_you.new(likes_you_params)
    if like.save
        #liked_user = TestPost.find(likes_you_params[:test_post_id]).user_id
        liked_user.update_without_password(:likes => liked_user.likes + "," + current_user.id.to_s)
        # liked_user_porfile = User.find(liked_user)
        # liked_user_porfile.update_without_password(:likes_you => liked_user_porfile.likes + "," + liked_user.to_s)
        flash[:success] = "liked"
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    # def current_test_post
    #   @test_post = TestPost.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def likes_you_params
      params.require(:likes_you).permit(:test_post_id, :user_id)
    end

end
