class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.text :name, null: false
      t.integer :number_of_lines
      t.integer :longest_speech_id
      t.timestamps
    end
  end
end
