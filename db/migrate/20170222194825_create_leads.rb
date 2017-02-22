class CreateLeads < ActiveRecord::Migration[5.0]
  def change
    create_table :leads do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :mousetrap
      t.string :ip_address
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :leads, :email, unique: true
    add_index :leads, :phone, unique: true
  end
end
