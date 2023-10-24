require 'rails_helper'

RSpec.describe 'Landing Page' do
  before :each do 
    user1 = User.create(name: "User One", email: "user1@test.com", password: "123abc", password_confirmation: "123abc")
    user2 = User.create(name: "User Two", email: "user2@test.com", password: "456xyz", password_confirmation: "456xyz")
    visit '/'
  end 

  it 'has a header' do
    expect(page).to have_content('Viewing Party Lite')
  end

  it 'has links/buttons that link to correct pages' do 
    click_button "Create New User"
    
    expect(current_path).to eq(register_path) 
    
    visit '/'
    click_link "Home"

    expect(current_path).to eq(root_path)
  end 

  it 'lists out existing users' do 
    user1 = User.create(name: "User One", email: "user1@test.com", password: "123abc", password_confirmation: "123abc")
    user2 = User.create(name: "User Two", email: "user2@test.com", password: "456xyz", password_confirmation: "456xyz")
    visit login_path

    fill_in :email, with: "user1@test.com"
    fill_in :password, with: '123abc'

    click_button 'Log In'
    visit '/'
    expect(page).to have_content('Existing Users:')

    within('.existing-users') do 
      expect(page).to have_content(user1.email)
      expect(page).to have_content(user2.email)
    end     
  end 
end
