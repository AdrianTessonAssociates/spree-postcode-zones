class Admin::PostcodeListsController < Admin::BaseController

  resource_controller

  def index
    @postcode_lists = PostcodeList.all
  end

  create.wants.html { redirect_to admin_postcode_lists_url }
  update.wants.html { redirect_to admin_postcode_lists_url }

end
