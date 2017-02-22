class CreateAttendings < ActiveRecord::Migration
  def change
    create_table :attendings do |t|
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps null: false
    end
    add_foreign_key :attendings, :users
    add_foreign_key :attendings, :events
  end
end
