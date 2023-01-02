class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_cur_user_posts
  before_action :check_new_user
  
  def home
      @test_posts = TestPost.where(sex: current_user.pref_sex).where.not(user_id: [current_user.id, current_user.likes.split(',').map!(&:to_i)])
      # check if user has been liked/ disliked by current
      @user = current_user
      #@user_likes_you = current_user.likes_you
      @user_likes = LikesYou.where(:user_id => current_user.id).pluck(:test_post_id)
      #@user_likes_you = LikesYou.where(:test_post_id => @cur_user_posts_ids).pluck(:user_id)
      # puts(current_user.likes_you.pluck(:test_post_id))
      #puts("before")
      #puts(@user_likes_you)
      #puts("asdjnaijsdniasndiasndjnasidniasd")
      @messages = Message.all #Message.where(user_id: current_user.id).or(Message.where( user2: current_user.id))
      matches = Match.where(user_id: current_user.id).or(Match.where( user2: current_user.id))
      @match_messaged = []
      @match_unmessaged = []
      matches.each do |match|
        if match.messaged == true
          @match_messaged.append(match)
        else
          @match_unmessaged.append(match)
        end
      end
  end

  def get_cur_user_posts
    @cur_user_posts_ids = TestPost.where(:user_id => current_user.id).pluck(:id)
  end

  # @test_posts.each do |t|
  #   if t.created_at < 1.week.ago.to_date
  #     @test_posts.delete(t) 
  #   end
  #   curr_id = t.user_id
  #   likes = User.where(:id => curr_id).pluck(:likes)[0].split(',').map!(&:to_i)
  #   dislikes = User.where(:id => curr_id).pluck(:dislikes)[0].split(',').map!(&:to_i)
  #   puts(likes_them.include?(curr_id))
  #   puts(likes_them)
  #   if likes_them.include?(curr_id) || dislikes_them.include?(curr_id)
  #     @test_posts.delete(t)
  #   end

  # end

  def explore
  end
  
  # def like
  #   @user = current_user
  #   @liked_user = User.find(params[:likes_you])

  #   @liked_user.likes_you = @user.id

  # end

  def profile
    @test_posts = TestPost.where(user_id: current_user.id)
  end

  def chat
    @messages = Message.all #Message.where(user_id: current_user.id).or(Message.where( user2: current_user.id))
    matches = Match.where(user_id: current_user.id).or(Match.where( user2: current_user.id))
    @match_messaged = []
    @match_unmessaged = []
    matches.each do |match|
        if match.messaged == true
          @match_messaged.append(match)
        else
          @match_unmessaged.append(match)
        end
    end
  end

  def admin
    if current_user.role != 2
      redirect_to root_path
    end
  end
end

private

def check_new_user
  if current_user.pref_sex == nil
    redirect_to preferences_path
  end
end

#User.where(sex:0).where.not(id:4)