require 'rails_helper'
RSpec.describe 'user profile page' do
  before do
    @user = User.create(name: 'kobe', email: 'kobe@lakers.com', password: 'password', password_confirmation: 'password')
    log_in @user
  end
  it 'displays information about the user' do
    expect(page).to have_text("#{@user.name}")
    expect(page).to have_link('Edit Profile')
  end
end