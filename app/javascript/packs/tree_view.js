import $ from 'jquery'
import 'jstree'

$.jstree.defaults.core.themes.icons = false

class TreeView {
  constructor(element_id) {
    this.element_id = element_id
    this.dataUrl = $(element_id).data('nodesUrl')
    this.initialize()
  }

  initialize = (() => {
    this.getData().done((data) => {
      this.setData(data)
      this.initJsTree()
    })
  })

  setData = ((data) => {
    this.data = this.formatData(data)
  })

  getData = (() => {
    return $.ajax({
      url: this.dataUrl,
      dataType: 'JSON'
    });
  })

  formatData = ((data) => {
    data.forEach((node) => {
      node.state = {[node.state]: true}
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
        data: this.data,
        multiple: false,
        animation: false,
        check_callback: true,
        themes: {
          stripes: true
        }
      }
    })
  })

  reinitJsTree = (() => {
    this.jstree().settings.core.data = this.data
    this.jstree().refresh()
  })

  jstree = (() => {
    return $(this.element_id).jstree()
  })

  getSelected = (() => {
    return this.jstree().get_selected()
  })

  getNode = (() => {
    let nodeId = this.getSelected(),
      parent_id = this.jstree().get_parent(nodeId)
    return {
      parent_id: parent_id,
      ...this.jstree().get_json(nodeId, {no_children: true})
    }
  })

  getAllNodes(options) {
    return this.jstree().get_json('#', options)
  }
}

export default TreeView