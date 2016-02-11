class CompaniesDisableSection < SitePrism::Section
  element :name, 'td:nth-child(1) a'
  element :active_button, 'td:nth-child(3) a'
  element :delete_button, 'td:nth-child(4) a'
end
