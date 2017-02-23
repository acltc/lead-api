class SettingsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @settings = Setting.find(1)
  end
end
