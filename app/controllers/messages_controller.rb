class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.save
    # 追加
    SampleJob.perform_later
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
