require 'rails_helper'

RSpec.describe 'Authentification', type: :system do
  it 'sign up user' do
    visit signup_path
    fill_in 'user[name]', with: 'marcela'
    click_button 'Create User'
    expect(page).to have_content('User was successfully created.')
  end
end
