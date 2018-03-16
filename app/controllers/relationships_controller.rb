class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    # フォローしようとしているユーザーオブジェクトを取得
    @user = User.find(params[:followed_id])
    
    # relationshipモデルのレコードを作成
    # follower_id : current_user
    # followed_id : @user
    current_user.follow(@user)
    
    # フォローされるユーザーが通知をONにしているときのみメールで通知
    if @user.followed_notification
      # フォローしたユーザーにフォローされたことをメールで通知
      UserMailer.followed_notification(@user, current_user).deliver_now
    end
    
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end