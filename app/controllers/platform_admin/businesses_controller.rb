class PlatformAdmin::BusinessesController < PlatformAdmin::BaseController
  def index
    @pending_businesses = Business.pending?
    @live_businesses = Business.active_or_inactive?
  end

  def update
    business = Business.find(params[:id])
    business.update(status: statuses[params[:filter]])
    flash[:success] = "Business has been #{params[:filter]}d!"
    redirect_to platform_admin_businesses_path
  end

  def destroy
    business = Business.find(params[:id])
    business.destroy
    flash[:success] = "Business successfully deleted."
    redirect_to platform_admin_businesses_path
  end

private

  def statuses
    {
      "activate" => "active",
      "deactivate" => 'inactive'
    }
  end
end
