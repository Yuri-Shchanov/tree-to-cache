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

    this.ajaxCreate(createData).done((response) => {
      this.setData(response)
      this.reinitJsTree()
    })
  })

  addChild = (() => {
    let node = this.getNode(),
      newNodeId = this.jstree().create_node(node)

    this.jstree().edit(newNodeId, 'New node', ((newNode) => {
      let parentId = this.jstree().get_parent(newNode),
        parent = this.jstree().get_json(parentId, {no_children: true}),
        parentAncestry = parent.data.ancestry

      let data = {
        text: newNode.text,
        ancestry: `${parentAncestry}/${parentId}`
      }

      this.ajaxCreate(data).then((response) => {
        this.setData(response)
        this.reinitJsTree()
      })
    }))
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

  destroy = (() => {
    let confirmText = 'Данное действие удалит выбранный элемент и всех его потомков. Вы уверены?'
    if (!confirm(confirmText)) return

    let node = this.getNode(),
      url = `${this.dataUrl}/${node.id}`

    $.ajax({
      url: url,
      dataType: 'JSON',
      method: 'DELETE',
    }).done((response) => {
      this.deselectAll()
      this.setData(response)
      this.reinitJsTree()
    })
  })

  ajaxCreate = ((data) => {
    return $.ajax({
      url: this.createUrl,
      dataType: 'JSON',
      method: 'POST',
      data: data
    })
  })
}

export default CachedTreeView
