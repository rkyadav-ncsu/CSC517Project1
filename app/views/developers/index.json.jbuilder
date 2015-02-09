json.array!(@developers) do |developer|
  json.extract! developer, :name, :email, :password
  json.url developer_url(developer, format: :json)
end
