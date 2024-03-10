# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"


videos = {
 "Salcombe Boat Company" => "https://res.cloudinary.com/dezhqd5rm/video/upload/v1709997316/RPReplay_Final1709996155_xmhjom.mov",
 "Batson Creek" => "https://res.cloudinary.com/dezhqd5rm/video/upload/v1710024480/RPReplay_Final1710024046_afbb5x.mov",
 "Totnes" => "https://res.cloudinary.com/dezhqd5rm/video/upload/v1710024490/RPReplay_Final1710024122_c4vl5x.mov"
}

number_of_videos = videos.count
video_name = 0

video_names = videos.keys
video_urls = videos.values

puts "Deleting the database"
Video.destroy_all

number_of_videos.times do
  video_name += 1
  clip = URI.open(video_urls.shift)
  name = "#{video_names.shift}"
  video = Video.new(name: name)
  video.clip.attach(io: clip, filename: "video.mp4", content_type: "video/mp4")
  puts "#{video.name} created"
  video.save!
end

puts "Videos created"
