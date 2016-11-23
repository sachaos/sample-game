class UsersController < ApplicationController
  def show
    render json: user
  end

  def update
    lua = Rufus::Lua::State.new
    lua.eval(File.read("lib/move_user.lua"))
    current_position = {x: user.x + 1, y: user.y + 1}
    lua_position, point = lua.eval("return game(#{Map.to_lua}, #{current_position.to_lua}, #{commands.to_lua})")
    update_param = {x: lua_position.to_h["x"] - 1, y: lua_position.to_h["y"] - 1, point: user.point + point}
    user.update(update_param)
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
