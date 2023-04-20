import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: [
      "<div class='hometext-left'><span class='hometext-yellow'>Connect with</span><span class='hometext-white'> Artists</span></div>",
      "<div class='hometext-left'><span class='hometext-yellow'>Connect with</span><span class='hometext-white'> Players</span></div>",
      "<div class='hometext-left'><span class='hometext-yellow'>Connect with</span><span class='hometext-white'> Performers</span></div>",
      "<div class='hometext-left'><span class='hometext-yellow'>Connect with</span><span class='hometext-white'> YOU</span></div>",
      "<div class='hometext-center'><span class='hometext-black'>Welcome to musique.wtf</span><br><span class='hometext-yellow' style='font-size: 30px;'>Where's The Funk?</span></div>"
    ],
      typeSpeed: 30,
      backSpeed: 50,
      startDelay: 1000,
      smartBackspace: true,
      loop: false
    })
  }
}
