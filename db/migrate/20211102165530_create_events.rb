class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.text :log_txt
      t.string :src
      t.string :dst
      t.timestamps
    end
  end
end
