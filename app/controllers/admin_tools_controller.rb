class AdminToolsController < ApplicationController
    before_action :authenticate_user!
    before_action :check_role!

    def check_role!
        if current_user.role == 2
            return true
        end
    end

    def search_user
        @searched_user = User.find(admin_params[:search])
        #puts(@searched_user)
        #redirect_to admin_path
    end

    def reset_matches
        Match.delete_all
    end

    def reset_likes
        LikesYou.delete_all
    end

    def reset_posts
        TestPost.delete_all
    end

    def reset_likes_dislikes
        User.update_all(:likes => "-1")
        User.update_all(:dislikes => "-1")
    end

    def admin_params
        params.require(:admin).permit(:search)#:authenticity_token , :commit
    end


end
