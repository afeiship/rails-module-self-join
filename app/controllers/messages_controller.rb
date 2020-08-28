class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new(:parent_id => params[:parent_id])
  end

  def create
    @message = Message.new(allow_params)
    if @message.save
      redirect_to messages_url
    else
      render :new
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_url
  end

  private

  def allow_params
    params.require(:message).permit!
  end
end
