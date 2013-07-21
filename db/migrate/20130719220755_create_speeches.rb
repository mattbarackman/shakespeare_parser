class CreateSpeeches < ActiveRecord::Migration
  def change
    create_table :speeches do |t|
      t.references :scene, null: false
    end
  end
end
