class CreateBloodSugars < ActiveRecord::Migration[5.1]
  def change
    create_table :blood_sugars do |t|
      t.integer :level, null: false
      t.timestamps
    end
  end
end
