class EditProfileCompanyPage < SitePrism::Page
  set_url '/manage/profile_companies/edit'

  element :name, "input[name='company[name]']"
  element :link, "input[name='company[link]']"
  element :image, "input[name='company[picture_attributes][image]']"
  element :button_add, "input[type='submit']"
end
