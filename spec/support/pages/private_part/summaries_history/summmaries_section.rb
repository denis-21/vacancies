class SummariesSection < SitePrism::Section
  element :vacancy_title, 'td:first'
  element :comapny_name, 'td:nth-child(2)'
  element :status, 'td:nth-child(4)'
  element :email, 'td:nth-child(5)'
  element :first_name, 'td:nth-child(6)'
  element :last_name, 'td:last'
end
