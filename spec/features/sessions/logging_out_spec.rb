require 'rails_helper'
RSpec.describe 'logging out' do
  before do
    @user = User.create(name: 'kobe', email: 'kobe@lakers.com', password: 'password', password_confirmation: 'password')
    log_in @user
  end
  it 'displays "Log Out" button when user is logged on' do
    expect(page).to have_button('Log Out')
  end
  it 'logs out user and redirects to login page' do
    click_button 'Log Out'
    expect(current_path).to eq('/sessions/new')
  end
end