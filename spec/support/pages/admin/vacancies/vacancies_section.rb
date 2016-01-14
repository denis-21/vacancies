class VacainciesSection < SitePrism::Section
  element :name, 'td:first a'
  element :delete_button, 'td:last a'
end
