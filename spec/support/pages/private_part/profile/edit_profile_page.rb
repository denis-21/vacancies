class EditProfilePage < SitePrism::Page
  set_url '/manage/profiles/edit'

  element :first_name, "input[name='profile[first_name]']"
  element :last_name, "input[name='profile[last_name]']"
  element :bith_date, "input[name='profile[bith_date]']"
  element :image, "input[name='profile[picture_attributes][image]']"
  element :button_add, "input[type='submit']"
end
