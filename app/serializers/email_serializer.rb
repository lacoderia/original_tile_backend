class EmailSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :email_status, :email_type
end
