class LeaderBoardController < ApplicationController
  def global
    player_hashes = global_players

    @top_numbers = top_players_by_game("numbers", player_hashes)
    @top_trivia = top_players_by_game("trivia", player_hashes)
    @top_hangman = top_players_by_game("hangman", player_hashes)
  end

  def index
    @chats = chat_list
  end

  def chat
    players = Player.where(chat_id: params[:chat_id]).flat_map {|p| p.attributes}
    @chat_name = players.first["chat_name"]
    @top_numbers = top_players_by_game("numbers", players)
    @top_trivia = top_players_by_game("trivia", players)
    @top_hangman = top_players_by_game("hangman", players)
  end

  private

  def chat_list
    chat_ids = Player.select(:chat_id).distinct.flat_map {|p| p.chat_id}
    chat_hashes = []

    chat_ids.each do |id|
      chat_hashes.append(Player.find_by(chat_id: id).attributes)
    end

    chat_hashes
  end

  def global_players
    telegram_ids = Player.select(:telegram_id).distinct

    global_players_hash = []

    telegram_ids.each do |t_player|
      global_players_hash.append(telegram_player_hash(t_player.telegram_id))
    end

    global_players_hash
  end

  def top_players_by_game(game, hashes_list)
    hashes_list.sort_by { |hsh| -hsh[game + "_wins"] }
  end

  def telegram_player_hash(id)
    telegram_players = Player.where(telegram_id: id)
    player_hash = telegram_players.first.attributes
    player_hash["numbers_wins"] = 0
    player_hash["trivia_wins"] = 0
    player_hash["hangman_wins"] = 0

    telegram_players.each do |t_player|
      player_hash["numbers_wins"] += t_player.numbers_wins
      player_hash["trivia_wins"] += t_player.trivia_wins
      player_hash["hangman_wins"] += t_player.hangman_wins
    end

    player_hash
  end
end
