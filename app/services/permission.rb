class Permission
  attr_reader :user, :controller, :action

  def initialize(user)
    @user = user || User.new
  end

  def allow?(controller, action)
    @controller = controller
    @action     = action

    case
    when user.platform_admin?
      platform_admin_permissions
    when user.business_admin?
      store_admin_permissions
    when user.default?
      registered_user_permissions
    else
      guest_user_permissions
    end
  end

  private

  def platform_admin_permissions
    return true if controller == "admin/properties"
    return true if controller == "admin/businesses"
    return true if controller == "locations/properties"
    return true if controller == "platform_admin/businesses"
    return true if controller == "businesses"
    return true if controller == "cart"
    return true if controller == "cart_items"
    return true if controller == "charges"
    return true if controller == "locations"
    return true if controller == "orders"
    return true if controller == "properties"
    return true if controller == "root"
    return true if controller == "sessions"
    return true if controller == "users"
  end

  def store_admin_permissions
    return true if controller == "admin/businesses"
    return true if controller == "admin/properties"
    return true if controller == "locations/properties"
    return true if controller == "platform_admin/businesses"
    return true if controller == "businesses"
    return true if controller == "cart"
    return true if controller == "cart_items"
    return true if controller == "charges"
    return true if controller == "locations"
    return true if controller == "orders"
    return true if controller == "properties"
    return true if controller == "root"
    return true if controller == "sessions"
    return true if controller == "users"
  end

  def registered_user_permissions
    return true if controller == "locations/properties"
    return true if controller == "businesses"
    return true if controller == "cart"
    return true if controller == "cart_items"
    return true if controller == "charges"
    return true if controller == "locations"
    return true if controller == "orders"
    return true if controller == "properties"
    return true if controller == "root"
    return true if controller == "sessions"
    return true if controller == "users"
  end

  def guest_user_permissions
    return true if controller == "locations/properties"
    return true if controller == "businesses" && action.in?(%w(show))
    return true if controller == "cart"
    return true if controller == "cart_items"
    return true if controller == "locations"
    return true if controller == "properties"
    return true if controller == "root"
    return true if controller == "sessions"
    return true if controller == "users" && action.in?(%w(new create))
  end
end
