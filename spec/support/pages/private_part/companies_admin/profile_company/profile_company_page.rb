require_relative 'profile_copmany_list_vacancies_section'

class ProfileCompanyPage < SitePrism::Page
  set_url '/manage/profile_companies'

  element :name_company, '.block_show > div > h1'
  element :link, 'span.text_black.text_bold'
  sections :list_vacancies, ProfileCompanyListVacaniciesSections, 'div.desc_vacancy > ul.list-group > li'

  def title_vacancies
    list_vacancies.map(&:link_vacancy_text)
  end

  def click_vacancy(title)
    vacancy = list_vacancies.find { |v| v.link_vacancy_text == title }
    vacancy.link_vacancy.click
  end
end
