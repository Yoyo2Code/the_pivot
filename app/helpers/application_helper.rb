module ApplicationHelper
  def items_index?
    # params[:controller] == 'items' &&
    #   params[:action] == 'index'
  end

  def related_location_or_business(property)
    if params[:city]
      sanitize(%Q[Property Owner: <a href="/#{property.business.slug}">#{property.business.name}</a>])
    else
      sanitize(%Q[Location: <a href="/locations/#{property.location.slug}">#{property.location.city}</a>])
    end
  end

  def owns_property?(property)
    property.business.user == current_user
  end

  def get_location(properties)
    properties.first.location
  end
end
