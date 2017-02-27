class AddEmailActiveToSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :settings, :email_active, :boolean
  end
end
