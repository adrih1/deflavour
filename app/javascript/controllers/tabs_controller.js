import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = ["aromatique", "alcool", "bar"]
  aromatique() {
    this.aromatiqueTarget.classList.remove("d-none")
    this.alcoolTarget.classList.add("d-none")
    this.barTarget.classList.add("d-none")
  }
  alcool() {
    this.aromatiqueTarget.classList.add("d-none")
    this.alcoolTarget.classList.remove("d-none")
    this.alcoolTarget.classList.remove("hidden-tab")
    this.barTarget.classList.add("d-none")
  }
  bar() {
    this.aromatiqueTarget.classList.add("d-none")
    this.alcoolTarget.classList.add("d-none")
    this.barTarget.classList.remove("d-none")
  }
}
