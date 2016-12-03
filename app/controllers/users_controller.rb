class UsersController < ApplicationController
  def show
    render json: user
  end

  def update
    move_user = MoveUser.new

    lua_table, point = move_user.game(Map, user.lua_position, commands)

    user.lua_position = lua_table.to_h
    user.point += point
    user.save
    render json: user
  end

  def destroy
    user.update(x: 0, y: 0, point: 0)
    head 204
  end

  private

  def user
    @user ||= User.find_or_create_by(id: 1)
  end

  def commands
    Array(params[:commands])
  end
end
