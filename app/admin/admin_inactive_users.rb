ActiveAdmin.register User, :as => "Todos_los_usuarios" do

  actions :all, :except => [:new, :show]

  permit_params :active

  filter :first_name, :label => "Nombre"
  filter :last_name, :label => "Apellido"
  filter :roles, :label => "Roles"
  filter :active, :label => "Activo"
  
  config.sort_order = 'created_at_desc'

  index :title => "Clientes" do
    column "Nombre", :first_name
    column "Apellido", :last_name
    column "Activo", :active
    actions :defaults => true
  end

  form do |f|
    f.inputs "Modificación de créditos" do
      f.input :first_name, label: "Nombres", :input_html => { :disabled => true, :style => "background-color: #d3d3d3;" }
      f.input :last_name, label: "Apellido", :input_html => { :disabled => true, :style => "background-color: #d3d3d3;" }
      f.input :email, label: "Email", :input_html => { :disabled => true, :style => "background-color: #d3d3d3;" }
      f.input :active
    end
    f.actions
  end

end
