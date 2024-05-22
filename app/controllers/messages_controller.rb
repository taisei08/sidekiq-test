class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.save!
    # ここでJobを実行する。
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
