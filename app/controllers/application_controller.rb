class ApplicationController < ActionController::Base
  add_flash_types :updated_obj_id
  before_action :map_flash

  private

  def map_flash
    @alert = alert
    @notice = notice
    @updated_obj_id = updated_obj_id
  end
end
