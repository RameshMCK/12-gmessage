require 'rails_helper'

RSpec.feature "Users", type: :feature do
    context 'logged in' do
    before(:each) do
      visit '/users/sign_in'
      fill_in 'user[email]', with: 'bob2@aol.com'
      fill_in 'user[password]', with: 'abc123'
      #fill_in 'user[password_confirmation]', with: 'password1'
      click_button 'Log in'
      
     #expect(page).to have_text('Sign up') 
     #expect(page).to have_text('Welcome! You have signed up successfully') 
     
    end

   scenario 'change color and photo' do
      visit '/users/edit'
      ##expect(current_path).to eql('yo')
      fill_in 'user[color]', with: '#000000'
      fill_in 'user[photo]', with: 'http://image.jpg'
      fill_in 'user[current_password]', with: 'pass1234'
      click_button 'Update'
      visit '/users/edit'
      expect(find_field('user[color]').value).to eql('#000000')
      expect(find_field('user[photo]').value).to eql('http://image.jpg')
    end
  end
  
    scenario 'do more logged in stuff' do
    end
  end
  
  context 'not logged in' do
    scenario 'do anonymous stuff' do
    end
end
