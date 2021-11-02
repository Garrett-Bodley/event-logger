class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.text :log
      t.decimal :source
      t.decimal :destination
      t.timestamps
    end
  end
end
