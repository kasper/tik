require 'spec_helper'

describe Team do

  let(:team) { FactoryGirl.create(:team) }

  it 'should not be valid without a name' do

    team = Team.create

    expect(team).not_to be_valid
    expect(Team.count).to be 0

  end

  it 'should be valid and saved with a name' do

    expect(team).to be_valid
    expect(Team.count).to be 1

  end

end
