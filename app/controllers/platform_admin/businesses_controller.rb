class PlatformAdmin::BusinessesController < PlatformAdmin::BaseController
  def index
    @businesses = Business.all
  end

  def pending
    @businesses = Business.where(status: 'pending')
    # params[:filter] # 'pending'
    # @partial = "#{params[:filter]}_businesses"
    # # /businesses?status=inactive&status=active
  end

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
    redirect_to businesses_pending_path
  end
  #
  # def destroy
  #   business = Business.find(params[:id])
  #   business.destroy
  #   flash[:success] = "Business successfully deleted."
  #   redirect_to businesses_pending_path
  # end

  # def statuses
  #   {
  #     "activate" => "active",
  #     "deactivate" => 'inactive'
  #   }
  # end

end
