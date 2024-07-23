class NotificationMailer < ApplicationMailer
  def new_like_email
    @user = params[:user]
    @like = params[:like]
    @post = @like.post

    mail(to: @user.email, subject: '新しいいいねがありました')
  end

  def new_repost_email
    @user = params[:user]
    @repost = params[:repost]
    @post = @repost.post

    mail(to: @user.email, subject: '新しいリポストがありました')
  end

  def new_reply_email
    @user = params[:user]
    @reply = params[:reply]

    mail(to: @user.email, subject: '新しい返信がありました')
  end
end
