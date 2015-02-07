json.array!(@recipes) do |recipe|
  json.extract! recipe, :title, :description, :instruction
  json.url recipe_url(recipe, format: :json)
end
