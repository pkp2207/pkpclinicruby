# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear the existing records
User.delete_all
Patient.delete_all

# Create example users
puts "Creating Users..."
User.create!(name: "Dr. John Smith", email: "john.smith@hospital.com", password: "password123", role: "doctor")
User.create!(name: "Jane Doe", email: "jane.doe@hospital.com", password: "password123", role: "receptionist")

# Create example patients
puts "Creating Patients..."
Patient.create!(first_name: "Emily", last_name: "Davis", dob: Date.new(1985, 4, 23), address: "123 Main St")
Patient.create!(first_name: "Michael", last_name: "Johnson", dob: Date.new(1978, 9, 12), address: "456 Oak St")
Patient.create!(first_name: "Sarah", last_name: "Brown", dob: Date.new(1992, 3, 15), address: "789 Maple Ave")
Patient.create!(first_name: "Robert", last_name: "Williams", dob: Date.new(2000, 11, 30), address: "101 Elm St")
Patient.create!(first_name: "Sophia", last_name: "Miller", dob: Date.new(1975, 6, 10), address: "202 Pine St")

# If you're using roles, here is an example
# Role.create!(name: "doctor")
# Role.create!(name: "receptionist")
# (Assign roles to users as needed)
# Create more users
puts "Creating Additional Users..."
User.create!(name: "Dr. Alice Morgan", email: "alice.morgan@hospital.com", password: "password123", role: "doctor")
User.create!(name: "Sam Clark", email: "sam.clark@hospital.com", password: "password123", role: "receptionist")

# Add more patients
puts "Creating Additional Patients..."
Patient.create!(first_name: "Liam", last_name: "Wilson", dob: Date.new(1998, 7, 18), address: "505 Cedar Rd")
Patient.create!(first_name: "Oliver", last_name: "Thomas", dob: Date.new(1988, 2, 26), address: "606 Birch Blvd")
Patient.create!(first_name: "Amelia", last_name: "Taylor", dob: Date.new(1967, 8, 9), address: "707 Chestnut Dr")
