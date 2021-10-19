import TreeView from './tree_view'

class DbTreeView extends TreeView {
  constructor(element_id) {
    super(element_id);

    let element = $(element_id)
    this.applyChangesUrl = element.data('applyChangesUrl')
  }

  applyChanges = ((data) => {
    if (data.length === 0) {
      return
    }
    let applyData = data.map((node) => {
      return {
        id: node.id,
        text: node.text,
        parent_id: node.data.parent_id,
        state: node.data.state
      }
    })

    $.ajax({
      url: this.applyChangesUrl,
      dataType: 'JSON',
      method: 'POST',
      data: {
        db_tree_views: applyData
      }
    }).done(() => {
      location.reload()
    })
  })
}

export default DbTreeView