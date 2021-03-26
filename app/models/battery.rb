class Battery < ApplicationRecord
    belongs_to :building ,optional: true
    has_many :columns
    has_one :intervention
end
