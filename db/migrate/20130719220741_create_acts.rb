class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.references :play, null: false
      t.text :title
      t.timestamps
    end
  end
end
