class SettingsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @settings = Setting.first
  end

  def edit
    @settings = Setting.find(params[:id])
  end

  def update
    @settings = Setting.find(params[:id])
    if @settings.update(
      email: params[:settings]["email"],
      phone: params[:settings]["phone"]
    )
      flash[:notice] = "Settings successfully updated."
      redirect_to setting_path(@settings)
    else
      flash[:alert] = "An error occured while updating settings. Please try again."
      render :edit
    end
  end
end
