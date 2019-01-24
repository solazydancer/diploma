# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Создание администратора
login = "admin"
email = "admin@local.me"
password = "123456"
User.create!(email: email, password: password, role: 1)

#Создание модератора
login = "moder"
email = "moder@local.me"
password = "654321"
User.create!(email: email, password: password, role: 2)