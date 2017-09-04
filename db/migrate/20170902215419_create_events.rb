class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :event_type, null: false
      t.integer :index, null: false
      t.timestamps
    end
  end
end
