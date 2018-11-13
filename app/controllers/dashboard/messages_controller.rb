class Dashboard::MessagesController < Dashboard::ApplicationController
  add_breadcrumb 'Vos messages', :dashboard_messages_path

  def index
    @conversations = current_user.conversations
  end

  def user
    @user = User.find_by(slug: params[:user_slug])
    @conversation = Conversation.between(current_user, @user)
    @conversation.mark_as_read_by!(current_user)
    @message = Message.new(from: current_user)
    add_breadcrumb @user
  end

  def create
    @user = User.find_by(slug: params[:user_slug])
    @conversation = Conversation.between(current_user, @user)
    if @conversation.nil?
      @conversation = Conversation.create
      @conversation.users << current_user
      @conversation.users << @user
    end
    @message = Message.new(message_params)
    @message.conversation = @conversation
    if @message.save
      redirect_to dashboard_conversation_path(user_slug: @user.slug), notice: 'Message bien envoyé.'
    else
      redirect_to dashboard_conversation_path(user_slug: @user.slug), notice: 'Erreur lors de l\'envoi du message'
    end
  end

  private

  def message_params
    params.require(:message).permit(:from_id, :content)
  end
end
