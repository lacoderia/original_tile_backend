# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Roles
internal_user_role = Role.create(name: 'internal_user')
external_user_role = Role.create(name: 'external_user')

internal_user = User.create(first_name: "Internal", last_name: "Quimare", email: "internal@email.com", roles: [internal_user_role], password: 'password', password_confirmation: 'password', active: true)
external_user = User.create(first_name: "External", last_name: "Quimare", email: "external@email.com", roles: [external_user_role], password: 'password', password_confirmation: 'password', active: true)

admin_user = AdminUser.create!(email: 'admin@originalmissiontile.com', password: 'password', password_confirmation: 'password')

color = Color.create!(name: "red", hex_value: "#FF0000", active: true)
tile = Tile.create!(url: "file_url", tile_type: "3x3", active: true)
project = Project.create!(url: "file_url", name: "saved project 1", user_id: internal_user.id)
