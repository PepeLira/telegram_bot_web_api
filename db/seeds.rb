# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Player.create(chat_id: 1,
              telegram_id:1,
              chat_name: "chat_1",
              username: "pepe",
              first_name: "pepe",
              numbers_wins: 0,
              trivia_wins: 0,
              hangman_wins: 0)

Player.create(chat_id: 2,
    telegram_id:1,
    chat_name: "chat_1",
    username: "pepe",
    first_name: "pepe",
    numbers_wins: 0,
    trivia_wins: 0,
    hangman_wins: 0)
