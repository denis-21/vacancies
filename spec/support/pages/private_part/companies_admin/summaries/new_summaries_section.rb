class NewSummariesSection < SitePrism::Section
  element :email, 'td:nth-child(1)'
  element :first_name, 'td:nth-child(2)'
  element :last_name, 'td:nth-child(3)'
  element :button_to_accept, 'td:nth-child(5) a'
  element :button_to_reject, 'td:nth-child(6) a'
end
