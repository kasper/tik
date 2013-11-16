require 'spec_helper'

describe 'Teams page' do

  let(:team) { FactoryGirl.create(:team) }

  it 'should not have any teams initially' do

    visit teams_path

    expect(page).to have_content 'Teams'

  end

  it 'should list created teams' do

    team

    visit teams_path

    expect(page).to have_content team.name

  end

end
