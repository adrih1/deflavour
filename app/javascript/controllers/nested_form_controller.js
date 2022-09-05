import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['target', 'template', 'tick', 'field']
  static values = {
    wrapperSelector: {
      type: String,
      default: '.nested-form-wrapper'
    }
  }

  connect() {

  }

  add(e) {
    e.preventDefault()
    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime().toString())
    this.targetTarget.insertAdjacentHTML('beforebegin', content)
    // this.fieldTarget.classList.add('ts-control-valid')
    console.log(e)
    this.tickTargets.slice(0, -1).forEach(tick => {
      tick.classList.remove('d-none')
    });
  }

  remove(e) {
    e.preventDefault()

    const wrapper = e.target.closest(this.wrapperSelectorValue)

    if (wrapper.dataset.newRecord === 'true') {
      wrapper.remove()
    } else {
      wrapper.style.display = 'none'

      const input = wrapper.querySelector("input[name*='_destroy']")
      input.value = '1'
    }
  }
}
