class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.references :speech, null: false
      t.text :content, null: false
    end
  end
end
