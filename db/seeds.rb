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


portrait_videos = {
  #  "Totnes" => "https://res.cloudinary.com/dezhqd5rm/video/upload/v1710024490/RPReplay_Final1710024122_c4vl5x.mov",
 "Snapes Point" => "https://res.cloudinary.com/dezhqd5rm/video/upload/v1710798917/Salcombe%20FPV/l4gm3tmr8vvyjq18bb0w.mp4",
 "Salcombe Boat Company" => "https://res.cloudinary.com/dezhqd5rm/video/upload/v1710798978/Salcombe%20FPV/hgoquccxhmq4yoyzbln6.mp4",
 "Batson Creek" => "https://res.cloudinary.com/dezhqd5rm/video/upload/v1710798895/Salcombe%20FPV/qst3tbraf3nmp1z0kkz3.mp4"
}

landscape_videos = {
  "Bird" => "https://res.cloudinary.com/dezhqd5rm/video/upload/v1710798937/Salcombe%20FPV/szukf5bfrfut6q27buf0.mp4",
  "Cape Town" => "https://res.cloudinary.com/dezhqd5rm/video/upload/v1710798972/Salcombe%20FPV/slxqfsykgvmv2ywzpk5t.mp4"
}

all_videos = portrait_videos.merge(landscape_videos)

number_of_videos = all_videos.count
video_name = 0

video_names = all_videos.keys
video_urls = all_videos.values

puts "Deleting the database"
Video.destroy_all


number_of_videos.times do
  video_name += 1
  clip = URI.open(video_urls.shift)
  name = "#{video_names.shift}"
  orientation = portrait_videos.key?(name) ? "Portrait" : "Landscape"
  # if portrait_videos.key?(name)
  #   orientation = "Portrait"
  # else
  #   orientation = "Landscape"
  # end
  video = Video.new(name: name, orientation: orientation)
  video.clip.attach(io: clip, filename: "video.mp4", content_type: "video/mp4")
  puts "#{video.name} created"
  video.save!
end

puts "Videos created"
