module ApplicationHelper
  def items_index?
    params[:controller] == 'items' &&
    params[:action] == 'index'
  end
end
