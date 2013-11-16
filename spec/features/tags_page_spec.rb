require 'spec_helper'

describe 'Tags page' do

  let(:tag) { FactoryGirl.create(:tag) }

  it 'should not have any tags initially' do

    visit tags_path

    expect(page).to have_content 'Tags'

  end

  it 'should list created tag' do

    tag

    visit tags_path

    expect(page).to have_content tag.name

  end

end
