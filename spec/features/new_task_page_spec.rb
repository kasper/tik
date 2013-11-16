require 'spec_helper'

describe 'New task page' do

  include LoginHelper

  let(:user) { FactoryGirl.create(:user) }

  before :each do

      log_in(user.username, 'repsak44')

  end

  it 'should create task' do

    visit new_task_path

    fill_in('task_description', :with => 'Test adding task')
    fill_in('tags', :with => 'ui, usability, test')

    click_button('Create Task')

    expect(page).to have_content 'Tasks'
    expect(page).to have_content 'Test adding task'

  end

  it 'should create tags' do

    visit new_task_path

    fill_in('task_description', :with => 'Test adding task')
    fill_in('tags', :with => 'ui, usability, test')

    click_button('Create Task')

    visit tags_path

    expect(page).to have_content 'ui'
    expect(page).to have_content 'usability'
    expect(page).to have_content 'test'

  end

  it 'should not create duplicate tags' do

    visit new_task_path

    fill_in('task_description', :with => 'Test adding task')
    fill_in('tags', :with => 'ui, usability, test')

    click_button('Create Task')

    visit new_task_path

    fill_in('task_description', :with => 'Test adding another task with same tags')
    fill_in('tags', :with => 'ui, usability, test')

    click_button('Create Task')

    visit tags_path

    expect(page.all('#main-panel .panel-body li').count).to be 3

  end

end
