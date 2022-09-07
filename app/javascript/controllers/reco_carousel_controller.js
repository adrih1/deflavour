import { Controller } from "@hotwired/stimulus"
import { preventDefault } from "tom-select/dist/types/utils"

// Connects to data-controller="reco-carousel"
export default class extends Controller {
  static targets = ['buttonreco', 'carousel', 'profile', 'redirect']

  connect() {
  }

  loading(event){
    this.carouselTarget.classList.remove('d-none')
    this.profileTarget.classList.add('d-none')
    this.buttonrecoTarget.classList.add('d-none')
    event.preventDefault()
    const timeout= setTimeout(() => {
      clearTimeout(timeout)
      this.redirectTarget.click()
    }, 2500,);

  }
}
