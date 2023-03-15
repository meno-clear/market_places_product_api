class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.string :street
      t.string :number
      t.string :district
      t.string :city
      t.string :state
      t.string :country
      t.string :postal_code
      t.string :type
      t.float :longitude
      t.float :latitude
      t.st_point :coordinates

      t.timestamps
    end
  end
end
