class MatchController < ApplicationController
    before_action :authenticate_user!

  def create
    match = current_user.match.new(match_params)
    
    if match.save
        flash[:success] = "matched"
    end
  end
  #belongs_to_many :user


  private
    # Use callbacks to share common setup or constraints between actions.
    # def current_test_post
    #   @test_post = TestPost.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def match_params
      params.require(:match).permit(:user_id, :user2, :user_name, :user2_name)
    end
end
