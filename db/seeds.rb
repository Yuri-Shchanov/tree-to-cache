DEFAULT_TREE = [{
  value: :node_1,
  children: [
    {value: :node_2},
    {value: :node_3},
    {
      value: :node_4,
      children: [
        {value: :node_5},
        {
          value: :node_6,
          children: [
            {
              value: :node_7,
              children: [
                {
                  value: :node_8,
                  children: [
                    {value: :node_9}
                  ]
                }
              ]
            }
          ]
        }
      ]
    }, {
      value: :node_10,
      children: [
        {value: :node_11},
        {
          value: :node_12,
          children: [
            {
              value: :node_13,
              children: [
                {
                  value: :node_14,
                  children: [
                    {value: :node_15}
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
    db_node = DbTreeView.create(value: node[:value], parent: parent)
    next unless node[:children]
    create_tree(node[:children], db_node)
  end
end

DbTreeView.delete_all
create_tree
