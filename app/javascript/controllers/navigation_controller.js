import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navigation"
export default class extends Controller {
  static targets = [ "sidebar" ]

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

  openSidebar() {
    this.sidebarTarget.classList.remove('hidden')
  }

  closeSidebar() {
    this.sidebarTarget.classList.add('hidden')
  }
}
