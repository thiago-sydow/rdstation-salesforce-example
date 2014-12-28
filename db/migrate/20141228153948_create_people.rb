class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :last_name
      t.string :company
      t.string :email
      t.string :job_title
      t.string :phone
      t.string :website
      t.string :owner_id
      t.boolean :converted
      t.boolean :unread_by_owner

      t.timestamps
    end
  end
end
