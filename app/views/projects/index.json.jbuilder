json.array!(@projects) do |project|
  json.extract! project, :name, :materials, :image
  json.url project_url(project, format: :json)
end
