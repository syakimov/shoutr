class ShoutsController < ApplicationController
  def create
    current_user.shouts.create(shout_params)
    redirect_to root_path
  end

  private

  def shout_params
    params.require(:shout).permit(:body)
  end
end
