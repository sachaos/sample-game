Rails.application.routes.draw do
  resource :map, only: [:show]
  resource :user, only: [:show, :update, :destroy]
end
