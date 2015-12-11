module LoginHelpers

  def http_basic_login username, password
    basic = ActionController::HttpAuthentication::Basic
    credentials = basic.encode_credentials(username, password)
    page.driver.header('Authorization', credentials)
  end
end
