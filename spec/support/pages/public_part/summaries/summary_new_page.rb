class SummaryNewPage < SitePrism::Page
  set_url '/vacancies/{id}/summaries/new'

  element :email, "input[name='summary[email]']"
  element :first_name, "input[name='summary[first_name]']"
  element :last_name, "input[name='summary[last_name]']"
  element :file, "input[name='summary[file]']"
  element :submit, "input[type='submit']"
end
