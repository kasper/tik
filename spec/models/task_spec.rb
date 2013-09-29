require 'spec_helper'

describe Task do

  let(:user) { FactoryGirl.create(:user) }
  let(:task) { FactoryGirl.create(:task) }
  let(:tag) { FactoryGirl.create(:tag) }

  it 'should not be valid without a description' do

    task = Task.create

    expect(task).not_to be_valid
    expect(Task.count).to be 0

  end

  it 'should not be valid without a creator' do

    task = Task.create(:description => 'Create another task')

    expect(task).not_to be_valid
    expect(Task.count).to be 0

  end

  it 'should not be valid without a owner' do

    task = Task.create(:description => 'Create another task', :creator => user)

    expect(task).not_to be_valid
    expect(Task.count).to be 0

  end

  it 'should be valid and saved with a description, creator and owner' do

    expect(task).to be_valid
    expect(Task.count).to be 1

  end

  it 'destroy should destroy orphan tags' do

    task.tags << tag
    task.save

    expect(task.tags.count).to be 1
    expect(Tag.count).to be 1
    expect { task.destroy }.to change(Tag, :count).by -1

  end

end
