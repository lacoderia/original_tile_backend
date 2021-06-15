ActiveAdmin.register Color, :as => "Colores" do

  actions :all, :except => [:show]
  
  permit_params :active, :name, :hex_value, :order

  filter :name, :label => "Nombre"
  filter :active, :label => "Activo"

  config.sort_order = 'order_asc'

  index :title => "Colores", :paginate => false do
    column "Nombre", :name
    column "Valor", :hex_value
    column "Preview" do |color|
      "<div style='background-color: #{color.hex_value}'>&nbsp;</div>".html_safe
    end
    column "Activo", :active
    column "Orden", :order
    column "Creado", :created_at
    column "Actualizado", :updated_at
    actions :defaults => true
  end

  form do |f|
    f.inputs "Detalles de colores" do
      f.input :name, label: "Nombre"
      f.input :hex_value, label: "Valor"
      f.input :active, label: "Activo"
      f.input :order, label: "Orden"
    end
    f.actions
  end  

end
