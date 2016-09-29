json.extract! index, :id, :url, :status, :created_at, :updated_at
json.resource_url index_url(index, format: :json)
json.elements index.elements, :id, :dom_type, :content
