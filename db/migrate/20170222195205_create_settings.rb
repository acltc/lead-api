class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.string :phone
      t.string :email
      t.boolean :active

      t.timestamps
    end
  end
end
