ActiveAdmin.register User, :as => "Todos_los_usuarios" do

  actions :all, :except => [:new, :show]

  permit_params :active

  filter :name, :label => "Nombre"
  filter :roles, :label => "Roles"
  filter :active, :label => "Activo"
  
  config.sort_order = 'created_at_desc'

  index :title => "Clientes" do
    column "Nombre", :name
    column "Activo", :active
    actions :defaults => true
  end

  form do |f|
    f.inputs "Detalles de clientes" do
      f.input :name, label: "Nombre", :input_html => { :disabled => true, :style => "background-color: #d3d3d3;" }
      f.input :email, label: "Email", :input_html => { :disabled => true, :style => "background-color: #d3d3d3;" }
      f.input :active
    end
    f.actions
  end

end
