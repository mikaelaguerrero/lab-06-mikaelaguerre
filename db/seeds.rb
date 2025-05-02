# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#para los 10 usuarios
10.times do |i|
    User.create!(
      email: "user#{i}@mail.com",
      first_name: "Nombre#{i}",
      last_name: "Apellido#{i}"
    )
  end
  
  # para los chats
  10.times do
    Chat.create!(
      sender_id: User.pluck(:id).sample,
      receiver_id: User.pluck(:id).sample
    )
  end
  
  # para los mensajes
  10.times do
    Message.create!(
      chat_id: Chat.pluck(:id).sample,
      user_id: User.pluck(:id).sample,
      body: "Este es un mensaje de prueba"
    )
  end
  