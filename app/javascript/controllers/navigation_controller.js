import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navigation"
export default class extends Controller {
  initialize() {
    const topNav = document.querySelector("header > nav")

    document.addEventListener('scroll', (e) => {
      if (window.scrollY > 0) {
        topNav.classList.add('bg-white')
      } else {
        topNav.classList.remove('bg-white')
      }
    })
  } 
}
