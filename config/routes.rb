Rails.application.routes.draw do
  get 'leader_board/global'
  get 'leader_board/index'
  get 'leader_board/chat/:chat_id', to: 'leader_board#chat', as: :chat_board
  namespace :api do
    namespace :v1 do
      post 'player/post_player_stats'
      get 'player/get_player_stats/:chat_id/', to: 'player#get_player_stats'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'leader_board#global'
end
