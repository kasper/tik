require 'spec_helper'

describe 'Login page' do

  let(:user) { FactoryGirl.create(:user) }

  it 'should not log in with invalid credentials' do

    visit login_path

    fill_in('username', :with => user.username)
    fill_in('password', :with => 'wrong')

    click_button('Log in')

    expect(current_path).to eq login_path
    expect(page).to have_content 'Username or password do not match.'

  end

  it 'should log in with valid credentials' do

    visit login_path

    fill_in('username', :with => user.username)
    fill_in('password', :with => 'repsak44')

    click_button('Log in')

    expect(current_path).to eq '/'

  end

end
