class RenameActiveToTextActiveInSettings < ActiveRecord::Migration[5.0]
  def change
    rename_column :settings, :active, :text_active
  end
end
