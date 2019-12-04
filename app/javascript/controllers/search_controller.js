import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "link" ]

  toggle(event) {
    event.stopImmediatePropagation()
    this.linkTarget.classList.toggle("hidden")
  }
}
