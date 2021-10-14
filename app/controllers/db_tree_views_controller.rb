class DbTreeViewsController < ApplicationController
  # GET /db_tree_views or /db_tree_views.json
  def show
    @db_tree_views = DbTreeView.select(:id, :text, :ancestry, :state).arrange_serializable do |parent, children|
      {
        children: children,
        id: parent.id,
        text: ERB::Util.h(parent.text),
        data: {
          ancestry: parent.ancestry,
        },
        state: parent.state,
      }
    end
  end
end
