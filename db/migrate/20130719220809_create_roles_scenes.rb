class CreateRolesScenes < ActiveRecord::Migration
  def change
    create_table :roles_scenes do |t|
      t.references :role, null: false
      t.references :scene, null: false
    end
  end
end
