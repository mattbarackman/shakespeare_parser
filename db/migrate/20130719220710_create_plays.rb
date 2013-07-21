class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.text :title, null: false
      t.timestamps
    end
  end
end
