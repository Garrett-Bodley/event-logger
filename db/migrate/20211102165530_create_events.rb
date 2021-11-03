class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.text :log_txt
      t.string :src
      t.string :dst
      t.boolean :is_valid, default: false, null: false
      t.boolean :is_private, default: false, null: false
      t.timestamps
    end
  end
end
