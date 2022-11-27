class Api::V1::PlayerController < ApplicationController

  def post_player_stats
    if player
      update_player
      render json: player, status: 201
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
        render json: player, status: 200
      else
        render json: {
          error: "Error Creatin new player",
          status: 500
        }
      end
    end
  end

  def get_player_stats
    if params[:chat_id].present? && params[:telegram_id].present?
      p = player(params[:chat_id],params[:telegram_id])
      render json: p, status: 200
    else 
      render json: {
        error: "Error Creatin new player",
        status: 500
      }
    end

  end

  private

  def player(c_id =  player_params[:chat_id], t_id = player_params[:telegram_id])
    Player.find_by(chat_id: c_id, telegram_id: t_id)
  end

  def update_player
    player.update(
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
