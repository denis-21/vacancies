json.extract! vacancy, *vacancy.attributes.keys
json.url_company api_v1_company_url(vacancy.company, format: :json)
json.company do
      json.name  vacancy.company.name
      json.link  vacancy.company.link
      json.url  api_v1_company_url(vacancy.company,format: :json)
end

