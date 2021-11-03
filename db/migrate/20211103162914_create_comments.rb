class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :content
      t.belongs_to :event
      t.timestamps
    end
  end
end
