class NotificationMailer < ApplicationMailer
  def new_like_email
    @user = params[:user]
    @like = params[:like]
    @post = @like.post

    mail(to: @user.email, subject: '新しいいいねがありました')
  end
end
