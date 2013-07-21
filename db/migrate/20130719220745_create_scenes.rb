class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.references :act, null: false
      t.text :title
      t.timestamps
    end
  end
end
