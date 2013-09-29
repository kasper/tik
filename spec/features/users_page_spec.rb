require 'spec_helper'

describe 'Users page' do

  let(:user) { FactoryGirl.create(:user) }

  it 'should not have any users initially' do

    visit users_path

    expect(page).to have_content 'Listing users'

  end

  it 'should list signed up users' do

    user

    visit users_path

    expect(page).to have_content user.username

  end

end
