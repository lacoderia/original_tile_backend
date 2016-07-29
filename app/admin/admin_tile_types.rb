ActiveAdmin.register TileType, :as => "Tipos" do
  
  actions :all, :except => [:show, :new, :destroy]
  
  permit_params :active, :key, :value, :centimeters, :inches

  config.filters = false

  index :title => "Tipos" do

    column "Tipo", :key
    column "Valor", :value
    column "Centimetros", :centimeters
    column "Pulgadas", :inches
    column "Activo", :active
    actions :defaults => true
    
  end

  form do |f|
    f.inputs "Detalles de tipos" do
      f.input :key, label: "Tipo"
      f.input :value, label: "Valor"
      f.input :centimeters, label: "Centimetros"
      f.input :inches, label: "Pulgadas"
      f.input :active, label: "Activo"
    end
    f.actions
  end  

end
