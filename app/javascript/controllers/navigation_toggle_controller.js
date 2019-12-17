import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "links" ]

  toggle(event) {
    event.stopImmediatePropagation()
    this.linksTarget.classList.toggle("hidden")
  }
}
