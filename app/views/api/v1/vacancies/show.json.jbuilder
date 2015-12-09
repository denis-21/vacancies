json.extract! vacancy, *vacancy.attributes.keys
json.url_company api_v1_company_url(vacancy.company, format: :json)
json.company_name vacancy.company.name
json.company_link api_v1_company_url(vacancy.company)
