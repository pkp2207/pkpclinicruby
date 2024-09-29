class AddRoleIdToPatients < ActiveRecord::Migration[6.1]
  def change
    add_reference :patients, :role, null: false, foreign_key: true
  end
end
