class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age
      t.string :address
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
