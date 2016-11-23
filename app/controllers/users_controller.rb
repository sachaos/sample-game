class UsersController < ApplicationController
  def show
    render json: user
  end

  def update
    user.send(params[:command])
    user.increment(:point) if Map[user.y][user.x] == 1
    return head 400 unless user.valid?
    user.save
    render json: user
  end

  private

  def user
    @user ||= User.find_or_create_by(id: 1)
  end
end
