json.array!(companies) do |company|
  json.extract!   company, *company.attributes.keys
  json.url        api_v1_company_url(company, format: :json)
end
