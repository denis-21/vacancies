class ListVacaniciesSections < SitePrism::Section
  element :link_vacancy, 'a'
  element :deadline, 'span'

  delegate :text, to: :link_vacancy, prefix: :link_vacancy
end
