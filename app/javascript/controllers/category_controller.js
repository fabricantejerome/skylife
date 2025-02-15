import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="category"
export default class extends Controller {
  initialize() {
    const btn = document.querySelector('.btn-logo')

    const loadFile = function(event) {
      const output = document.querySelector('.logo');
      output.src = URL.createObjectURL(event.target.files[0]);
      output.onload = function() {
        URL.revokeObjectURL(output.src) // free memory
      }
    };
  
    btn.addEventListener('change', loadFile)
  }
}
