require 'spec_helper'

describe 'Tasks page' do

  let(:task) { FactoryGirl.create(:task) }

  it 'should not have any tasks initially' do

    visit tasks_path

    expect(page).to have_content 'Listing tasks'

  end

  it 'should list created task' do

    task

    visit tasks_path

    expect(page).to have_content task.description

  end

end
