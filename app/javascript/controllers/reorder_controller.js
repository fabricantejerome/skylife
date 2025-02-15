import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reorder"
export default class extends Controller {
  static classes = [ 'activeDropzone', 'dropTarget' ]

  connect() {
  }

  dragstart(event) {
    this.element.classList.add(...this.activeDropzoneClasses)
    let draggableItem = this.getDataNode(event.target)
    event.dataTransfer.setData('application/drag-key', draggableItem.dataset.reorderableId)
    event.dataTransfer.effectAllowed = 'move'
  }

  dragover(event) {
    // console.log(event)
    // console.log(this.getDataNode(event.target))
    event.preventDefault()
    return true;
  }

  drop(event) {   
    const dropTarget = this.getDataNode(event.target)
    const data = event.dataTransfer.getData('application/drag-key')
    
    const draggedItem = document.querySelector(`[data-reorderable-id="${data}"]`)
    console.log(draggedItem)
    if (draggedItem) {
      if (dropTarget.compareDocumentPosition(draggedItem) & Node.DOCUMENT_POSITION_FOLLOWING) {
        dropTarget.insertAdjacentElement('beforebegin', draggedItem)
      } else if (dropTarget.compareDocumentPosition(draggedItem) & Node.DOCUMENT_POSITION_PRECEDING) {
        dropTarget.insertAdjacentElement('afterend', draggedItem)
      }
    }
  }

  dragend(event) {
    this.element.classList.remove(...this.activeDropzoneClasses)
  }

  dragenter(event) {
    let dropTarget = this.getDataNode(event.target)
    dropTarget.classList.add(...this.dropTargetClass)
  }

  dragleave(event) {
    let dropTarget = this.getDataNode(event.target)
    dropTarget.classList.remove(...this.dropTargetClass)
  }

  getDataNode(node) {
    return node.closest('[data-reorderable-id]')
  }
}