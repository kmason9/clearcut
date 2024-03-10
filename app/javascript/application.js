// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import VideoController from "./controllers/video_controller.js"
Stimulus.register("video-play", VideoController)
