class ChatsController < ApplicationController
  load_and_authorize_resource

  def index
    @chats = Chat.involving(current_user)
  end

  def show
  end

  def new
    @users = User.all
  end

  def edit
  end

  def create
    @users = User.all

    if @chat.save
      redirect_to @chat, notice: "Chat was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @chat.update(chat_params)
      redirect_to @chat, notice: "Chat was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @chat.destroy!
    redirect_to chats_path, notice: "Chat was successfully destroyed.", status: :see_other
  end

  private

    def chat_params
      params.require(:chat).permit(:sender_id, :receiver_id)
    end
end
