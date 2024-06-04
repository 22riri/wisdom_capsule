# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."

Memory.destroy_all
Memorybox.destroy_all
Timecapsule.destroy_all
User.destroy_all

puts "Create amigo imaginario"

user1 = User.create(email: "amigoo@gmail.com", password: "123456")
user2 = User.create(email: "outroamigo@gmail.com", password: "123456")

puts "creating time capsule"

timecapsule1 = Timecapsule.create(name: "Caixa teste", user_id: user1.id)

puts "Creating 1 memorybox"

memorybox1 = Memorybox.create(title: "vacations", timecapsule_id: timecapsule1.id, user_id: user2.id)

puts "creating 2 memories"

memory1 = Memory.create(text: "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham", date_of_memory:"2024-06-01", memorybox_id:memorybox1.id )
memory2 = Memory.create(text: "undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum", date_of_memory: "2024-06-02", memorybox_id: memorybox1.id)
