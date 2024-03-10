import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["video", "text"]

  connect() {
    console.log("Hello from our first Stimulus controller");
  }

  play() {
    console.log("playing")
    this.videoTarget.play()
    this.textTarget.classList.remove("d-none")
  }

  pause() {
    this.videoTarget.pause()
    this.textTarget.classList.add("d-none")
  }

  // textShow() {
  //   this.textTarget.classList.remove("d-none")
  //   console.log("text showing")
  // }
}
