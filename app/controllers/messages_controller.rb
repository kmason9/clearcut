class MessagesController < ApplicationController
  def new
    @message = Message.new
    @message.recipient_email = "mirstykason@hotmail.com"
  end

  def create
    @message = Message.new(message_params)
    # @message.save

    if @message.save
      redirect_to contact_path, notice: "Email sent successfully"
    else
      render :new
    end

  end

  private

  def message_params
    params.require(:message).permit(:subject, :body, :sender_email)
  end
end
