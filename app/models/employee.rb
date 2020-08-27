class Employee < ApplicationRecord
  has_many :subordinates, class_name: "Employee",
                          foreign_key: "superior_id"
  belongs_to :superior, class_name: "Employee", optional: true
end
