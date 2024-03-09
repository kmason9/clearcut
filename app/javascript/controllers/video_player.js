import { Controller } from "@hotwired/stimulus"

document.addEventListener('turbolinks:load', () => {
  const videos = document.querySelectorAll('.video-hover');

  videos.forEach(video => {
    video.addEventListener('mouseenter', () => {
      video.play();
    });
    video.addEventListener('mouseleave', () => {
      video.pause();
    });
  });
});
