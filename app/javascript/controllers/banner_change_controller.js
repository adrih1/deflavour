import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="banner-change"
export default class extends Controller {
  static targets = ['button', 'banner', 'subcontainer']

  connect() {
    console.log('Hello')
  }


  newexperience(){
    this.subcontainerTarget.classList.remove("banner-subcontainer")
    this.subcontainerTarget.classList.add("banner-subcontainer-full")
    this.buttonTarget.classList.add("d-none")
    this.bannerTarget.classList.remove("experience-form-container")
  }

}
