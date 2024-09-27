class Patient < ApplicationRecord
    validates :first_name, :last_name, :dob, presence: true
  end
  