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

internal_user = User.create(name: "Internal Quimare", email: "internal@email.com", roles: [internal_user_role], password: 'password', password_confirmation: 'password', active: true, city: "CDMX", country: "Mexico", state: "CDMX")
external_user = User.create(name: "External Quimare", email: "external@email.com", roles: [external_user_role], password: 'password', password_confirmation: 'password', active: true, city: "CDMX", country: "Mexico", state: "CDMX")

admin_user = AdminUser.create!(email: 'admin@originalmissiontile.com', password: 'password', password_confirmation: 'password')

color = Color.create!(name: "red", hex_value: "#FF0000", active: true)
project = Project.create!(url: "file_url", name: "saved project 1", user_id: internal_user.id)

tile_01 = Tile.create!(url: "file_url", tile_type: "3x3", active: true, name: "uno 3x3")
tile_02 = Tile.create!(url: "file_url", tile_type: "4x4", active: true, name: "dos 4x4")
tile_03 = Tile.create!(url: "file_url", tile_type: "6x6", active: true, name: "tres 6x6")
tile_04 = Tile.create!(url: "file_url", tile_type: "8x8", active: true, name: "cuatro 8x8")
tile_05 = Tile.create!(url: "file_url", tile_type: "10x10", active: true, name: "cinco 10x10")
tile_06 = Tile.create!(url: "file_url", tile_type: "12x12", active: true, name: "seis 12x12")
