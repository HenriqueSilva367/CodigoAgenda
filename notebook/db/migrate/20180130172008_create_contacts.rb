class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.references :Kind, index: true
      t.text :rmk

      t.timestamps
    end
  end
end
