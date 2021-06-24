ActiveAdmin.register User, :as => "Todos_los_usuarios" do
  menu if: proc{current_admin_user.role?("superadmin")}

  actions :all, :except => [:new]

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

  show do |user|
  
    attributes_table do

      row "Nombre" do
        user.name
      end
      row "Email" do
        user.email
      end
      row "Active" do
        user.active
      end
      row "Fecha" do
        user.created_at
      end
      row "Fecha" do
        user.reference
      end
      row "Teléfono" do
        user.phone
      end
      row "Fecha" do
        user.created_at
      end
      row "Dirección" do
        user.address
      end
      row "Zip" do
        user.zip
      end
      row "Ciudad" do
        user.city
      end
      row "Estado" do
        user.state
      end
      row "País" do
        user.country
      end
      row "Geo" do
        user.location
      end
      row "Origen" do
        (user.role? :internal_user) ? "Interno" : "Externo"
      end
      row "Última visita" do
        user.last_sign_in_at.nil? ? "Sin registro" : user.last_sign_in_at
      end
      row "Empresa" do
        user.company_name
      end
      row "Puesto" do
        user.job_title
      end
      row "Tipo de negocio" do
        user.business_type
      end
      row "Tipo de instalación" do
        user.type_of_installation
      end
      row "Cómo escuchó sobre nosotros?" do
        user.about_us
      end
      row "Referencias de proyecto" do
        user.project_references
      end
      row "Tipo de diseños y cantidad" do
        user.designs_quantities
      end
      row "Dirección de envío" do
        user.complete_delivery_address
      end
      row "Mensaje" do
        user.message
      end

    end

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
