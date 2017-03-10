require 'rails_helper'
RSpec.describe 'logging in' do
  before do
    @user = User.create(name: 'kobe', email: 'kobe@lakers.com', password: 'password', password_confirmation: 'password')

  end
  it 'prompts for email and password' do
    visit '/sessions/new'
    expect(page).to have_field('Email')
    expect(page).to have_field('Password')
  end
  it 'logs in user if email/password combination is valid' do
      visit '/sessions/new'
      fill_in 'Email', with: 'kobe@lakers.com'
      fill_in 'Password', with: 'password'
      click_button 'Log In'
 
    expect(current_path).to eq("/users/#{@user.id}")
    expect(page).to have_text(@user.name)
  end
  it 'does not sign in user if email/password combination is invalid' do
    log_in @user, 'wrong password'
    expect(page).to have_text('Invalid')
  end
end