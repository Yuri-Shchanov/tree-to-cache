import DbTreeView from './db_tree_view'
import CachedTreeView from './cached_tree_view'

$(document).ready(() => {
  let DbTree = new DbTreeView('#db-tree'),
    CachedTree = new CachedTreeView('#cached-tree')

  $('.add-node-to-cached').click(() => {
    let nodeData = DbTree.getNode()
    CachedTree.add(nodeData)
  })

  $('.rename-node-btn').click(() => {
    CachedTree.edit()
  })

  $('.add-child-node-btn').click(() => {
    CachedTree.addChild()
  })

  $('.remove-node-btn').click(() => {
    CachedTree.destroy()
  })

  $('.apply-changes-btn').click(() => {
    let cachedNodes = CachedTree.getAllNodes({flat: true})
    DbTree.applyChanges(cachedNodes)
  })

  $('.reset-btn').click((e) => {
    let $element = $(e.target),
      confirmText = 'Данное действие очистит все сделанные изменения и вернет базу к начальному состоянию. Вы уверены?'
    if (!confirm(confirmText)) return

    let url = $element.data('resetPath')

    $.ajax({
      url: url,
      dataType: 'JSON',
      method: 'POST',
    }).done(() => {
      location.reload()
    })
  })
})
