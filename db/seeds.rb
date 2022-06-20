# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
password = Faker::Internet.password
user = User.create!(email: Faker::Internet.email, password: password, password_confirmation: password)
event = Event.create!(title: Faker::Book.title, user_id: user.id)
screen = Screen.create!(event_id: event.id, user_id: user.id, name: Faker::Book.title)
playlist = Playlist.create!(title: Faker::Book.title, screen_id: screen.id, user_id: user.id)
content = Content.create!(file_key: "#{Faker::Internet.uuid} #{Faker::Book.title}", user_id: user.id)
PlaylistContent.create!(content_id: content.id, playlist_id: playlist.id, duration: Faker::Number.number, priority: Faker::Number.number, user_id: user.id)
