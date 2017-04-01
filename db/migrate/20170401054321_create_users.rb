class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name, null: false
      t.integer :age, null: false
      t.string  :address, null: false
      t.string  :email, null: false
      t.string  :password, null: false
      t.string  :old_password

      t.timestamps
    end
  end
end
