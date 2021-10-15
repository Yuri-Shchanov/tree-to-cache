DEFAULT_TREE = [{
  text: :node_1,
  children: [
    {text: :node_2},
    {text: :node_3},
    {
      text: :node_4,
      children: [
        {text: :node_5},
        {
          text: :node_6,
          children: [
            {
              text: :node_7,
              children: [
                {
                  text: :node_8,
                  children: [
                    {text: :node_9}
                  ]
                }
              ]
            }
          ]
        }
      ]
    }, {
      text: :node_10,
      children: [
        {text: :node_11},
        {
          text: :node_12,
          children: [
            {
              text: :node_13,
              children: [
                {
                  text: :node_14,
                  children: [
                    {text: :node_15}
                  ]
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}]

def create_tree(tree = DEFAULT_TREE, parent = nil)
  tree.each do |node|
    db_node = DbTreeView.create(text: node[:text], parent: parent)
    next unless node[:children]
    create_tree(node[:children], db_node)
  end
end

DbTreeView.delete_all
CachedTreeView.delete_all
create_tree
