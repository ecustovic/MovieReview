import { Controller } from "stimulus"
import tippy from 'tippy.js';
import 'tippy.js/dist/tippy.css';
import 'tippy.js/themes/light.css';

export default class extends Controller {
  static targets = [ "toggler", "links" ]

  connect() {
    tippy(this.togglerTarget, {
      content: this.linksTarget.innerHTML,
      theme: 'light',
      interactive: true,
      trigger: 'click',
      boundary: "viewport"
    });
  }
}