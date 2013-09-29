require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.create(:user) }

  it 'should not be valid without a username' do

    user = User.create

    expect(user).not_to be_valid
    expect(User.count).to be 0

  end

  it 'should not be valid with a username less than three characters' do

    user = User.create(:username => 'ka')

    expect(user).not_to be_valid
    expect(User.count).to be 0

  end

  it 'should not be valid with a username more than 15 characters' do

    user = User.create(:username => 'abcdefghijklmnop')

    expect(user).not_to be_valid
    expect(User.count).to be 0

  end

  it 'should not be valid without a unique username' do

    user
    invalid_user = User.create(:username => 'kasper', :password => 'repsak44', :password_confirmation => 'repsak44')

    expect(invalid_user).not_to be_valid
    expect(User.count).to be 1

  end

  it 'should not be valid without a password' do

    user = User.create(:username => 'kasper')

    expect(user).not_to be_valid
    expect(User.count).to be 0

  end

  it 'should not be valid with a password under eight characters' do

    user = User.create(:username => 'kasper', :password => 'repsak4', :password_confirmation => 'repsak4')

    expect(user).not_to be_valid
    expect(User.count).to be 0

  end

end
