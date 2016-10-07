class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :avatar
      t.string :sex
      t.date :birth_date
      t.string :street
      t.string :complement
      t.string :neighborhood
      t.string :zip_code
      t.references :city, foreign_key: true
      t.references :state, foreign_key: true
      t.references :country, foreign_key: true
      
      t.timestamps
    end
  end
end
