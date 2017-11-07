class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :movies_checked_out_count, :state, :postal_code, :phone, :registered_at, :account_credit
end
