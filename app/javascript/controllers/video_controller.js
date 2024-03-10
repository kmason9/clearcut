import { Controller } from "@hotwired/stimulus"

// document.addEventListener('turbolinks:load', () => {
//   const videos = document.querySelectorAll('.video-hover');

//   videos.forEach(video => {
//     video.addEventListener('mouseenter', () => {
//       video.play();
//     });
//     video.addEventListener('mouseleave', () => {
//       video.pause();
//     });
//   });
// });

export default class extends Controller {

  connect() {
    console.log("Hello from our first Stimulus controller");
  }

  play() {
    this.element.play
    console.log("playing")
  }
}
