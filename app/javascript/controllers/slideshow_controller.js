import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "image", "previous", "next" ]

  next(event) {
    event.stopImmediatePropagation()
    for(var i = 0; i < this.imageTargets.length; i++) {
      if(!this.imageTargets[i].classList.contains('hidden')) {
        if(this.imageTargets[i].nextElementSibling != undefined) {
          this.imageTargets[i].classList.add("hidden")
          this.imageTargets[i].nextElementSibling.classList.remove("hidden")
          break;
        }
      }
    }
  }

  previous(event) {
    event.stopImmediatePropagation()
    for(var i = 0; i < this.imageTargets.length; i++) {
      if(!this.imageTargets[i].classList.contains('hidden')) {
        if(this.imageTargets[i].previousElementSibling != undefined) {
          this.imageTargets[i].classList.add("hidden")
          this.imageTargets[i].previousElementSibling.classList.remove("hidden")
          break;
        }
      }
    }
  }
}
