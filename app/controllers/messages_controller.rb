class MessagesController < ApplicationController
    
    def index
        
        @sent_messges  = @user.sent_messages
        @received =  @user.received_messages
    end
    
    def new
        @message =  Message.new
    end
    
    def save_favorite
         @message = Message.find(params[:id])
         binding.pry
         if @message.update(params[:message].permit(:is_favorite))
          redirect_to @message
        else
          render 'index'
        end
         
    end


    def sent
        #binding.pry
        @sent_messges  = @user.sent_messages
    end

 def show
     @message = Message.find(params[:id])
 end
    
  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to messages_path
  end
    
    def create
        @message = Message.new(params[:message].permit(:subject, :body))
        @message.receiver = User.where(email: params[:message][:email]).limit(1).first
        @message.sender = @user
        if @message.save
          redirect_to messages_path
        else
          render 'new'
        end
  end
end