json.array!(vacancies) do |vacancy|
  json.extract! vacancy, *vacancy.attributes.keys
  json.url api_v1_vacancy_url(vacancy, format: :json)
  json.company_name vacancy.company.name
end