json.extract! customer, :id, :name, :code, :created_at, :updated_at
json.url customer_url(customer, format: :json)
