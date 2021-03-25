class Column < ApplicationRecord
    belongs_to :battery ,optional: true
    has_many :elevators
    has_one :intervention
end
