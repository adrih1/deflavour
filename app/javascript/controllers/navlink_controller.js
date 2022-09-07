import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navlink"
export default class extends Controller {
  static targets = ["aromatique", "alcool", "bar"]
  aromatique() {
    this.aromatiqueTarget.classList.add("nav-link-active")
    this.aromatiqueTarget.classList.remove("nav-link")
    this.alcoolTarget.classList.remove("nav-link-active")
    this.barTarget.classList.remove("nav-link-active")
    this.alcoolTarget.classList.add("nav-link")
    this.barTarget.classList.add("nav-link")
  }
  alcool() {
    this.alcoolTarget.classList.add("nav-link-active")
    this.alcoolTarget.classList.remove("nav-link")
    this.aromatiqueTarget.classList.add("nav-link")
    this.aromatiqueTarget.classList.remove("nav-link-active")
    this.barTarget.classList.add("nav-link")
    this.barTarget.classList.remove("nav-link-active")
  }
  bar() {
    this.barTarget.classList.add("nav-link-active")
    this.barTarget.classList.remove("nav-link")
    this.alcoolTarget.classList.remove("nav-link-active")
    this.alcoolTarget.classList.add("nav-link")
    this.aromatiqueTarget.classList.remove("nav-link-active")
    this.aromatiqueTarget.classList.add("nav-link")
  }
}
