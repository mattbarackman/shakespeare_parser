class CreateRolesSpeeches < ActiveRecord::Migration
  def change
    create_table :roles_speeches do |t|
      t.references :role
      t.references :speech
    end
  end
end
