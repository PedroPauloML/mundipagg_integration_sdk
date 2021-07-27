json.extract! item, :id, :amount, :description, :code, :category, :status, :created_at, :updated_at
json.url item_url(item, format: :json)
