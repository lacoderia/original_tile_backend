ActiveAdmin.register Tile, :as => "Disenios" do

  actions :all, :except => [:show]
  
  permit_params :active, :image, :tile_type_id, :name

  filter :name, :label => "Nombre"
  filter :tile_type_id, :label => "Tipo", :as => :select, :collection => TileType.all.map{|u| [u.key, u.id]}
  filter :active, :label => "Activo"

  config.sort_order = 'created_at_desc'

  index :title => "Disenios" do
    column "Nombre", :name
    column "Imagen", :image, :class => "photo_thumb" do |tile|
      link_to( (image_tag tile.image.url), tile.image.url, :target=>"_blank" )
    end
    column "Tipo", :tile_type do |tile|
      tile.tile_type.key
    end
    column "Activo", :active
    actions :defaults => true
  end

  form do |f|
    f.inputs "Detalles de disenios" do
      f.input :name, label: "Nombre"
      f.input :tile_type_id, label: "Tipo", :collection => TileType.all.map{|u| [u.key, u.id]}, :as => :select, :include_blank => false
      f.input :image, :required => false, :as => :file
      f.input :active, label: "Activo"
    end
    f.actions
  end  

end
