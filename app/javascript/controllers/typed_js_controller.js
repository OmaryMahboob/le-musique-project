import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["<div class='hometext-left'><span class='hometext-yellow'>Connect with</span><span class='hometext-white'> Artists</span></div>",
                "<div class='hometext-left'><span class='hometext-yellow'>Connect with</span><span class='hometext-white'> Players</span></div>",
                "<div class='hometext-left'><span class='hometext-yellow'>Connect with</span><span class='hometext-white'> Performers</span></div>",
                "<div class='hometext-left'><span class='hometext-yellow'>Connect with</span><span class='hometext-white'> You!</span></div>",
                "<div class='hometext-right'><span class='hometext-white'>Create with </span><span class='hometext-yellow'>passion</span></div>",
                "<div class='hometext-right'><span class='hometext-white'>Create with </span><span class='hometext-yellow'>Fervor</span></div>",
                "<div class='hometext-right'><span class='hometext-white'>Create with </span><span class='hometext-yellow'>energy</span></div>",
                "<div class='hometext-right'><span class='hometext-white'>Create with </span><span class='hometext-yellow'>you!</span></div>",
                "<div class='hometext-center'><span class='hometext-yellow'>Unleash Your Musical Journey</span></div>",
    ],
      typeSpeed: 30,
      backSpeed: 50,
      startDelay: 1000,
      smartBackspace: true,
      loop: false
    })
  }
}
