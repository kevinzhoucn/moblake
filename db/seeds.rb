# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.create(email: "admin01@yahoo.com", password: "Passw0rd01!")
Admin.create(email: "admin02@yahoo.com", password: "Passw0rd01!")
Admin.create(email: "admin03@yahoo.com", password: "Passw0rd01!")

# Task.create(name: "default", description: "default", reviewed: "default", user_id: "0", admin_id: "0")

Task.create(name: "App1", description: "App1 name")
Task.create(name: "App2", description: "App2 name")
Task.create(name: "App3", description: "App3 name")
Task.create(name: "App4", description: "App4 name")
Task.create(name: "App5", description: "App5 name")
