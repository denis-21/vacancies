json.extract! company, *company.attributes.keys
json.vacancies  company.vacancies.active do |vacancy|
  json.title      vacancy.title
  json.url        api_v1_vacancy_url(vacancy)
  json.deadline   vacancy.deadline
end
