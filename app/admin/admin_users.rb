ActiveAdmin.register User, :as => "Todos_los_usuarios" do

  actions :all, :except => [:new, :show]

  permit_params :active

  filter :name, :label => "Nombre"
  filter :email, :label => "Email"
  filter :active, :label => "Activo"
  filter :reference, :label => "Referencia"
  filter :phone, :label => "Teléfono"
  filter :address, :label => "Dirección"
  filter :city, :label => "Ciudad"
  filter :zip, :label => "Zip"
  filter :state, :label => "Estado"
  filter :country, :label => "País"
  filter :location, :label => "Geo"
  filter :roles, :label => "Origen"
  filter :last_sign_in_at, :label => "Última visita"
  filter :created_at, :label => "Fecha"
  
  config.sort_order = 'created_at_desc'

  index :title => "Clientes" do
    column "Nombre", :name
    column "Email", :email
    column "Activo", :active
    column "Fecha", :created_at
    column "Referencia", :reference
    column "Teléfono", :phone
    column "Dirección", :address
    column "Zip", :zip
    column "Ciudad", :city
    column "Estado", :state
    column "País", :country
    column "Geo", :location
    column "Origen" do |user|
      (user.role? :internal_user) ? "Interno" : "Externo"
    end
    column "Última visita", :last_sign_in_at, sortable: :last_sign_in_at do |user|
      user.last_sign_in_at.nil? ? "Sin registro" : user.last_sign_in_at
    end
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

  csv do
    column "Nombre" do |user|
      user.name
    end
    column "Email" do |user|
      user.email
    end
    column "Activo" do |user|
      user.active
    end
    column "Fecha" do |user|
      user.created_at
    end
    column "Referencia" do |user|
      user.reference
    end
    column "Teléfono" do |user|
      user.phone
    end
    column "Dirección" do |user|
      user.address
    end
    column "Ciudad" do |user|
      user.city
    end
    column "Zip" do |user|
      user.zip
    end
    column "Estado" do |user|
      user.state
    end
    column "País" do |user|
      user.country
    end
    column "Geo" do |user|
      user.location
    end
    column "Origen" do |user|
      (user.role? :internal_user) ? "Interno" : "Externo"
    end
  end

end
