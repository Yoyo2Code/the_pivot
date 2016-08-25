module ApplicationHelper

  def current_business_admin?
    current_user && current_user.business_admin?
  end

  def my_property?(property)
    business_owner? && owns_property?(property)
  end

  def current_platform_admin?
    current_user && current_user.platform_admin?
  end

  def current_admin?
    current_user && (current_user.business_admin? || current_user.platform_admin?)
  end

  def business_owner?
    current_admin? && current_user.business
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

  def get_business_name
    Business.find_by(slug: params[:business_name]).name
  end
end
