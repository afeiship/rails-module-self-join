# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

e1 = Employee.create(name: "e1")
e2 = Employee.create(name: "e2")
e3 = Employee.create(name: "e3")
e4 = Employee.create(name: "e4")
e5 = Employee.create(name: "e5")

e1 = Employee.find(1)
e2 = Employee.find(2)
e3 = Employee.find(3)
e4 = Employee.find(4)
e5 = Employee.find(5)

e2.parent = e1
e3.parent = e1

e2.save
e3.save

e4.parent = e3
e5.parent = e3
e4.save
e5.save

e1.ancestors(from_depth: 0, to_depth: 2)
e1.descendants(:from_depth => 0, :to_depth => 2)
