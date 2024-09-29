class AssignDefaultRoleToUsers < ActiveRecord::Migration[6.0]
  def up
    # Assuming you have Role model and the roles are already created
    doctor_role = Role.find_or_create_by!(name: "doctor")
    receptionist_role = Role.find_or_create_by!(name: "receptionist")
    
    # Assign default role based on some criteria or all users
    User.where(email: "john.smith@hospital.com").update_all(role_id: doctor_role.id)
    User.where(email: "jane.doe@hospital.com").update_all(role_id: receptionist_role.id)
    
    # Assign default role to other users if needed
  end

  def down
    # Remove role assignment if necessary
    User.update_all(role_id: nil)
  end
end
