import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reco-carousel"
export default class extends Controller {
  static targets = ['buttonreco', 'carousel', 'profile', 'redirect']

  connect() {
  }

  loading(){
    this.carouselTarget.classList.remove('d-none')
    this.profileTarget.classList.add('d-none')
    this.buttonrecoTarget.classList.add('d-none')
    setTimeout(() => {
      this.redirectTarget.click()
    }, 3000);
  }
}
