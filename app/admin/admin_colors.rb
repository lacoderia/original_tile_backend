ActiveAdmin.register Color, :as => "Colores" do

  actions :all, :except => [:show]
  
  permit_params :active, :name, :hex_value

  filter :name, :label => "Nombre"
  filter :active, :label => "Activo"

  config.sort_order = 'created_at_desc'

  index :title => "Colores" do
    column "Nombre", :name
    column "Valor", :hex_value
    column "Activo", :active
    actions :defaults => true
  end

  form do |f|
    f.inputs "Detalles de colores" do
      f.input :name, label: "Nombre"
      f.input :hex_value, label: "Valor"
      f.input :active, label: "Activo"
    end
    f.actions
  end  

end
