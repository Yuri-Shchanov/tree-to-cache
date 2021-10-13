import $ from 'jquery'
import 'jstree'

$.jstree.defaults.core.themes.icons = false

class DbTreeView {
  constructor(element_id) {
    this.element_id = element_id
    this.dataUrl = $(element_id).data('nodesUrl')
    this.getData().done((data) => {
      this.data = this.formatData(data)
      this.initJsTree()
    })
  }

  getData = (() => {
    return $.ajax({
      url: this.dataUrl,
      dataType: 'JSON'
    });
  })

  formatData = ((data) => {
    data.forEach((node) => {
      node.state = {opened: true}
      if (node.children !== undefined) {
        this.formatData(node.children)
      }
    })
    return data
  })

  initJsTree = (() => {
    $(this.element_id).jstree({
      'core': {
        worker: false,
        data: this.data
      }
    })
  })
}

$(document).ready(() => {
    let DbTree = new DbTreeView('#db-tree')
})
