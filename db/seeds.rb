# Clear the existing records
User.delete_all
Patient.delete_all
Role.delete_all

# Create roles
puts "Creating Roles..."
doctor_role = Role.find_or_create_by!(name: "doctor")
receptionist_role = Role.find_or_create_by!(name: "receptionist")
patient_role = Role.find_or_create_by!(name: "patient")

# Create example users
puts "Creating Users..."
User.create!(name: "Dr. John Smith", email: "john.smith@hospital.com", password: "password123", role_id: doctor_role.id)
User.create!(name: "Jane Doe", email: "jane.doe@hospital.com", password: "password123", role_id: receptionist_role.id)

# Create example patients
puts "Creating Patients..."
patients = [
  { first_name: "Emily", last_name: "Davis", dob: Date.new(1985, 4, 23), address: "123 Main St", role_id: patient_role.id },
  { first_name: "Michael", last_name: "Johnson", dob: Date.new(1978, 9, 12), address: "456 Oak St", role_id: patient_role.id },
  { first_name: "Sarah", last_name: "Brown", dob: Date.new(1992, 3, 15), address: "789 Maple Ave", role_id: patient_role.id },
  { first_name: "Robert", last_name: "Williams", dob: Date.new(2000, 11, 30), address: "101 Elm St", role_id: patient_role.id },
  { first_name: "Sophia", last_name: "Miller", dob: Date.new(1975, 6, 10), address: "202 Pine St", role_id: patient_role.id },
]

patients.each do |patient_data|
  patient = Patient.create!(patient_data)
  # Create a corresponding user for each patient
  User.create!(
    name: "#{patient.first_name} #{patient.last_name}",
    email: "#{patient.first_name.downcase}.#{patient.last_name.downcase}@patient.com",
    password: "password123",
    role_id: patient_role.id
  )
end

# Create more users
puts "Creating Additional Users..."
User.create!(name: "Dr. Alice Morgan", email: "alice.morgan@hospital.com", password: "password123", role_id: doctor_role.id)
User.create!(name: "Sam Clark", email: "sam.clark@hospital.com", password: "password123", role_id: receptionist_role.id)

# Add more patients
puts "Creating Additional Patients..."
additional_patients = [
  { first_name: "Liam", last_name: "Wilson", dob: Date.new(1998, 7, 18), address: "505 Cedar Rd", role_id: patient_role.id },
  { first_name: "Oliver", last_name: "Thomas", dob: Date.new(1988, 2, 26), address: "606 Birch Blvd", role_id: patient_role.id },
  { first_name: "Amelia", last_name: "Taylor", dob: Date.new(1967, 8, 9), address: "707 Chestnut Dr", role_id: patient_role.id },
]

additional_patients.each do |patient_data|
  patient = Patient.create!(patient_data)
  # Create a corresponding user for each additional patient
  User.create!(
    name: "#{patient.first_name} #{patient.last_name}",
    email: "#{patient.first_name.downcase}.#{patient.last_name.downcase}@patient.com",
    password: "password123",
    role_id: patient_role.id
  )
end
