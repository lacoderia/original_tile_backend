ActiveAdmin.register TileType, :as => "Tipos" do
  menu if: proc{current_admin_user.role?("superadmin")}
  
  actions :all, :except => [:show, :destroy]
  
  permit_params :active, :key, :value, :centimeters, :inches, :shape

  config.sort_order = 'centimeters_desc'
  
  config.filters = false

  index :title => "Tipos" do

    column "Tipo", :key
    column "Valor", :value
    column "Centimetros", :centimeters
    column "Pulgadas", :inches
    column "Forma", :shape
    column "Activo", :active
    actions :defaults => true
    
  end

  form do |f|
    f.inputs "Detalles de tipos" do
      f.input :key, label: "Tipo"
      f.input :value, label: "Valor"
      f.input :centimeters, label: "Centimetros"
      f.input :inches, label: "Pulgadas", as: :select, collection: TileType::INCHES.flatten
      f.input :shape, label: "Forma", collection: TileType::TYPES.map{|t| t[0]}
      
      f.input :active, label: "Activo"
    end
    f.actions
  end  

end
