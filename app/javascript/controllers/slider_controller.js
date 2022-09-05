import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slider"
export default class extends Controller {
  static targets = ['number', 'input']
  change() {
    console.log("connecté")
    this.numberTarget.innerText = this.inputTarget.value

  }
}
