class Dashboard::MessagesController < Dashboard::ApplicationController
  def index
  end

  def user
    @user = User.find_by(slug: params[:user_slug])
    @messages = Message.where(from: current_user, to: @user).or(Message.where(from: @user, to: current_user)).order(created_at: :desc)
    @message = Message.new(from: current_user, to: @user)
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to dashboard_conversation_path(user_slug: @message.to.slug), notice: 'Message bien envoyé.'
    else
      redirect_to dashboard_conversation_path(user_slug: @message.to.slug), notice: 'Erreur lors de l\'envoi du message'
    end
  end

  private

  def message_params
    params.require(:message).permit(:from_id, :to_id, :content)
  end
end
