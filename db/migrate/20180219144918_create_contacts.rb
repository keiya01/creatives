class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.text :contents
      t.string :user_id

      t.timestamps
    end
  end
end
