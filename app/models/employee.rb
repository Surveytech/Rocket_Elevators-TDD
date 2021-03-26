class Employee < ApplicationRecord
    belongs_to :user
    has_many :buildings
    has_many :interventions
    def fullname
        "ID: #{id} - #{first_name} #{last_name}"
    end
end
