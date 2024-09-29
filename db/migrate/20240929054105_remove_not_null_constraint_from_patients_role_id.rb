class RemoveNotNullConstraintFromPatientsRoleId < ActiveRecord::Migration[6.0]
  def change
    change_column_null :patients, :role_id, true
  end
end
