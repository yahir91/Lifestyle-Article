# frozen_string_literal: true

module ApplicationHelper
  def login_logout
    if current_user
      link_to 'Log out', logout_path
    else
      link_to 'Log in', login_path
end
end
end
