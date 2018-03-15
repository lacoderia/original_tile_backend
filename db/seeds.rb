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

internal_user = User.create(name: "Internal Quimare", email: "internal@email.com", roles: [internal_user_role], password: 'password', password_confirmation: 'password', active: true, city: "CDMX", country: "Mexico", state: "CDMX", location: "MX")
external_user = User.create(name: "External Quimare", email: "external@email.com", roles: [external_user_role], password: 'password', password_confirmation: 'password', active: true, city: "CDMX", country: "Mexico", state: "CDMX", location: "MX")

admin_user = AdminUser.create!(email: 'admin@originalmissiontile.com', password: 'password', password_confirmation: 'password')

color = Color.create!(name: "red", hex_value: "#FF0000", active: true)
project = Project.create!(url: "file_url", name: "saved project 1", user_id: internal_user.id)

tile_type_01 = TileType.create!(key: '3x3', value: '3x3" (7.5x7.5cm)', centimeters: 7.5, inches: 3, active: true)
tile_type_02 = TileType.create!(key: '4x4', value: '4x4" (10x10cm)', centimeters: 10, inches: 4, active: true)
tile_type_03 = TileType.create!(key: '6x6', value: '6x6" (15x15cm)', centimeters: 15, inches: 6, active: true)
tile_type_04 = TileType.create!(key: '8x8', value: '8x8" (20x20cm)', centimeters: 20, inches: 8, active: true)
tile_type_05 = TileType.create!(key: '10x10', value: '10x10" (25x25cm)', centimeters: 25, inches: 10, active: true)
tile_type_06 = TileType.create!(key: '12x12', value: '12x12" (30x30cm)', centimeters: 30, inches: 12, active: true)

tile_01 = Tile.create!(url: "file_url", tile_type: tile_type_01, active: true, name: "uno 3x3")
tile_02 = Tile.create!(url: "file_url", tile_type: tile_type_02, active: true, name: "dos 4x4")
tile_03 = Tile.create!(url: "file_url", tile_type: tile_type_03, active: true, name: "tres 6x6")
tile_04 = Tile.create!(url: "file_url", tile_type: tile_type_04, active: true, name: "cuatro 8x8")
tile_05 = Tile.create!(url: "file_url", tile_type: tile_type_05, active: true, name: "cinco 10x10")
tile_06 = Tile.create!(url: "file_url", tile_type: tile_type_06, active: true, name: "seis 12x12")

Config.create(key: "request_registration_email", value: "sales@originalmissiontile.com")
