class TreeViewDecorator < Draper::Decorator
  delegate_all

  def list
    object.select(:id, :text, :parent_id, :state).arrange_serializable do |parent, children|
      {
        children: children,
        id: parent.id,
        text: ERB::Util.h(parent.text),
        data: {
          state: parent.state,
          parent_id: parent.parent_id
        }
      }
    end
  end
end
