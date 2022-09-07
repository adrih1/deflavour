import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loader"
export default class extends Controller {
  static targets = ['title','experiences', 'content', 'submit']

  connect() {
  }

  loading(){
    this.titleTarget.classList.add('d-none')
    this.experiencesTarget.classList.add('d-none')
    this.contentTarget.classList.remove('d-none')
    const timeout= setTimeout(() => {
      clearTimeout(timeout)
      this.submitTarget.click()
    }, 1750,);
  }
}
