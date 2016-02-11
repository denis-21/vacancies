class RejectedSummariesSection < SitePrism::Section
  element :email, 'td:nth-child(1)'
  element :first_name, 'td:nth-child(2)'
  element :last_name, 'td:nth-child(3)'
end
