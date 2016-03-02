module PrivatePart
  class BaseController < ::ApplicationController
    layout 'manage_application'
    before_action :authenticate_user!
  end
end
