import TreeView from './tree_view'

class CachedTreeView extends TreeView {
  constructor(element_id) {
    super(element_id);
    let element = $(element_id)
    this.createUrl = element.data('createUrl')
  }

  add = ((data) => {
    let createData = {
      id: data.id,
      text: data.text,
    }
    if (data.data.ancestry) {
      createData.ancestry = data.data.ancestry
    }

    $.ajax({
      url: this.createUrl,
      dataType: 'JSON',
      method: 'POST',
      data: createData
    }).done((response) => {
      this.setData(response)
      this.reinitJsTree()
    })
  })

  edit = (() => {
    let node = this.getNode(),
      url = `${this.dataUrl}/${node.id}`
    this.jstree().edit(node, node.text, ((node, is_edited, is_canseled, text) => {
      if (is_edited && !is_canseled) {
        $.ajax({
          url: url,
          dataType: 'JSON',
          method: 'PATCH',
          data: {
            text: text
          }
        })
      }
    }))
  })
}

export default CachedTreeView
