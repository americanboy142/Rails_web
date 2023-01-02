class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages or /messages.json
  def index
    @messages = Message.where(:match_id => message_params[:match_id])
    @match_id = message_params[:match_id]
    @matched_user = find_matched_user
  end
  # esablish who is user1, user2
  def find_matched_user
    user1 = User.find(Match.find(message_params[:match_id]).user_id)
    if user1.id == current_user.id
      return User.find(Match.find(message_params[:match_id]).user2)
    else
      return user1
    end

  end

  # GET /messages/1 or /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        check_messaged
        @message.update_attribute(:delivered, true)
        #format.html { redirect_to message_url(@message), notice: "Message was successfully created." }
        #format.json { render :show, status: :created, location: @message }
      else
        #format.html { render :new, status: :unprocessable_entity }
        #format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def check_messaged
    curr_match = Match.find(message_params[:match_id])
    if curr_match.messaged == false
      curr_match.update_attribute(:messaged, true)
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to message_url(@message), notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:body, :user_id, :match_id)
    end
end
