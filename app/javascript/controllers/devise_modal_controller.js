import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="devise-modal"
export default class extends Controller {
  static targets = ['buttonlogin', 'buttonsignup', 'loginform', 'signupform', 'textlogin', 'textsignup']

  connect() {
  }

  login(){
    this.buttonloginTarget.classList.remove('opacity-50')
    this.buttonsignupTarget.classList.add('opacity-50')
    this.loginformTarget.classList.remove("d-none")
    this.signupformTarget.classList.add("d-none")
    this.textloginTarget.classList.remove("d-none")
    this.textsignupTarget.classList.add("d-none")
  }


  signup(){
    this.buttonsignupTarget.classList.remove('opacity-50')
    this.buttonloginTarget.classList.add('opacity-50')
    this.signupformTarget.classList.remove("d-none")
    this.loginformTarget.classList.add("d-none")
    this.textsignupTarget.classList.remove("d-none")
    this.textloginTarget.classList.add("d-none")
  }
}
