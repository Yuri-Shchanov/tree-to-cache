class TreeViewDecorator < Draper::Decorator
  delegate_all

  def list
    object.select(:id, :text, :ancestry, :state).arrange_serializable do |parent, children|
      {
        children: children,
        id: parent.id,
        text: ERB::Util.h(parent.text),
        data: {
          ancestry: parent.ancestry,
          state: parent.state,
        }
      }
    end
  end
end
