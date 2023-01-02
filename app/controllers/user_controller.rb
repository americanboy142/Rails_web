class UserController < ApplicationController
    before_action :set_user, only: [:update] # probably want to keep using this
    before_action :authenticate_user!

    def preferences
        @user = current_user
    end
    def show

    end
    def edit

    end

  
    # # PATCH/PUT /users/1
    # # PATCH/PUT /users/1.json
    def update
      @user = current_user
      puts("iasdnoasndas")
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:name, :bio, :pref_sex, :pref_age_max, :pref_age_min, 
            :pref_dist_min , :pref_dist_max , :likes, :likes_you )
      end
  


end
