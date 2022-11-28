class Api::V1::PlayerController < ApplicationController

  def post_player_stats
    if find_player
      update_player
      render json: find_player, status: 201
    else
      p = Player.new(
        chat_id: player_params[:chat_id],
        telegram_id: player_params[:telegram_id],
        chat_name: player_params[:chat_name],
        username: player_params[:username],
        first_name: player_params[:first_name],
        numbers_wins: player_params[:numbers_wins],
        trivia_wins: player_params[:trivia_wins],
        hangman_wins: player_params[:hangman_wins]
      )
      if p.save
        render json: find_player, status: 200
      else
        render json: {
          error: "Error Creatin new player",
          status: 500
        }
      end
    end
  end

  def get_player_stats
    if params[:chat_id].present?
      players = Player.where(chat_id: params[:chat_id].to_i)
      render json: players, status: 200
    else 
      render json: {
        error: "Error Creatin new player",
        status: 500
      }
    end
  end

  private

  def find_player(c_id =  player_params[:chat_id], t_id = player_params[:telegram_id])
    Player.find_by(chat_id: c_id, telegram_id: t_id)
  end

  def update_player
    find_player.update(
      chat_id: player_params[:chat_id],
      telegram_id: player_params[:telegram_id],
      chat_name: player_params[:chat_name],
      username: player_params[:username],
      first_name: player_params[:first_name],
      numbers_wins: player_params[:numbers_wins],
      trivia_wins: player_params[:trivia_wins],
      hangman_wins: player_params[:hangman_wins]
    )
  end

  def player_params
    params.require(:player).permit([
      :chat_id,
      :telegram_id,
      :chat_name,
      :username,
      :first_name,
      :numbers_wins,
      :trivia_wins,
      :hangman_wins
    ])
  end
end
