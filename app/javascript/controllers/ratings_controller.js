// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>
import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = [ "star" ]

  hover(e) {
    e.currentTarget.classList.add("star-hover")
    let previousStar = e.currentTarget.previousElementSibling
    while(previousStar != null) {
      previousStar.classList.add("star-hover")
      previousStar = previousStar.previousElementSibling
    }
  }

  remove(e) {
    e.currentTarget.classList.remove("star-hover")
    let previousStar = e.currentTarget.previousElementSibling
    while(previousStar != null) {
      previousStar.classList.remove("star-hover")
      previousStar = previousStar.previousElementSibling
    }
  }

  rate(event){
    Rails.ajax({
      url: `/movies/${this.element.dataset.slug}/reviews`,
      type: "POST",
      data: `review[stars]=${event.currentTarget.dataset.rating}`,
      dataType: "script"
    })
  }
}
