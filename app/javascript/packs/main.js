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
})
