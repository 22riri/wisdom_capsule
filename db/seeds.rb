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

user1 = User.create(email: "amigoo@gmail.com", password: "123456", username: "amigo")

puts "creating a time capsule for #{user1.username}..."

timecapsule1 = Timecapsule.create(name: "Philine", user_id: user1.id)

puts "Creating 1 memorybox for #{user1.username}..."

memorybox1 = Memorybox.create(title: "Vacations in Mykonos", timecapsule_id: timecapsule1.id, user_id: user1.id)

puts "creating 8 memories..."

require "open-uri"
# creer une file
file = URI.open("https://images.unsplash.com/photo-1533573103248-543ca8890e42?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
memory_one = Memory.new(title: "First sunset of the trip", text: "The view was breathtaking", date_of_memory: "2024-06-01", memorybox_id: memorybox1.id)
memory_one.media.attach(io: file, filename: "nes.png", content_type: "image/png")
# attacher l image a la memory
memory_one.save

# Memory.create(title: "Feline", text: "undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum", date_of_memory: "2024-06-02", memorybox_id: memorybox1.id)

file_two = URI.open("https://static.wikia.nocookie.net/naturerules1/images/f/f2/Bb1a160590bebc84f4a2c9a70f0cb7fd.png/revision/latest?cb=20210316221839")
memory_two = Memory.new(title: "We met Dolphins", text: "Oh my god we were able to swim with them", date_of_memory: "2024-06-03", memorybox_id: memorybox1.id)
memory_two.media.attach(io: file_two, filename: "nes.png", content_type: "image/png")
memory_two.save

file_three = URI.open("https://plus.unsplash.com/premium_photo-1661868392234-9d1659f2053e?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
memory_three = Memory.new(title: "Boat day !", text: "It was so much fun", date_of_memory: "2024-06-04", memorybox_id: memorybox1.id)
memory_three.media.attach(io: file_three, filename: "nes.png", content_type: "image/png")
memory_three.save

file_four = URI.open("https://images.unsplash.com/photo-1528495612343-9ca9f4a4de28?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
memory_four = Memory.new(title: "Craaazy party", text: "What happens in Mykonos stays in Mykonos (hihi)", date_of_memory: "2024-06-05", memorybox_id: memorybox1.id)
memory_four.media.attach(io: file_four, filename: "nes.png", content_type: "image/png")
memory_four.save

file_five = URI.open("https://plus.unsplash.com/premium_photo-1661690248576-181b6547d026?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
memory_five = Memory.new(title: "Last day ...", text: "It went by so fast but we made such amazing memories together !", date_of_memory: "2024-06-11", memorybox_id: memorybox1.id)
memory_five.media.attach(io: file_five, filename: "nes.png", content_type: "image/png")
memory_five.save

file_six = URI.open("https://images.unsplash.com/photo-1649434150059-13fee33e1de4?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
memory_six = Memory.new(title: "Petits farcis, miam !", text: "The food was so gooood !", date_of_memory: "2024-06-07", memorybox_id: memorybox1.id)
memory_six.media.attach(io: file_six, filename: "nes.png", content_type: "image/png")
memory_six.save

file_seven = URI.open("https://images.unsplash.com/photo-1519214605650-76a613ee3245?q=80&w=2938&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
memory_seven = Memory.new(title: "Disco night", text: "I will never forget that funny dance !", date_of_memory: "2024-06-09", memorybox_id: memorybox1.id)
memory_seven.media.attach(io: file_seven, filename: "nes.png", content_type: "image/png")
memory_seven.save

file_eight = URI.open("https://images.unsplash.com/photo-1505867798796-639ec7e8cdf5?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
memory_eight = Memory.new(title: "Jet ski day", text: "That fall was legendary !", date_of_memory: "2024-06-10", memorybox_id: memorybox1.id)
memory_eight.media.attach(io: file_eight, filename: "nes.png", content_type: "image/png")
memory_eight.save

puts "Database seeded"
