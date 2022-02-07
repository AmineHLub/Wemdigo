json.extract! tran, :id, :name, :amount, :created_at, :updated_at
json.url tran_url(tran, format: :json)
