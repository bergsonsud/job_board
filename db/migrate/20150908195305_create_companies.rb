class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :string
      t.string :email
      t.string :encrypted_password

      t.timestamps
    end
  end
end
