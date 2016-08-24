class PlatformAdmin::BusinessesController < PlatformAdmin::BaseController
  def index
    @pending_businesses = Business.pending?
    @live_businesses = Business.active_or_inactive?
  end

  # def pending
  #   @businesses = Business.where(status: 'pending')
    # params[:filter] # 'pending'
    # @partial = "#{params[:filter]}_businesses"
    # # /businesses?status=inactive&status=active
  # end

  # def manage
  #   @businesses = Business.where(status: ['active', 'inactive'])
  # end

  def update
    business = Business.find(params[:id])
    business.update(status: statuses[params[:action]])
    # if params[:action] == "activate"
    #   business.update(status: 'active')
    # elsif params[:action] == "deactivate"
    #   business.update(status: 'inactive')
    # end
    flash[:success] = "Business has been #{params[:action]}d!"
    redirect_to platform_admin_businesses_path
  end
  #
  # def destroy
  #   business = Business.find(params[:id])
  #   business.destroy
  #   flash[:success] = "Business successfully deleted."
  #   redirect_to businesses_pending_path
  # end

private

  def statuses
    {
      "activate" => "active",
      "deactivate" => 'inactive'
    }
  end
end
