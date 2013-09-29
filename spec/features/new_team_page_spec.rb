require 'spec_helper'

describe 'New team page' do

  include LoginHelper

  let(:user) { FactoryGirl.create(:user) }

  before :each do

      log_in(user.username, 'repsak44')

  end

  it 'should create team' do

    visit new_team_path

    fill_in('team_name', :with => 'Software')

    click_button('Create Team')

    expect(page).to have_content 'Listing teams'
    expect(page).to have_content 'Software'

  end

end
