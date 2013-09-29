require 'spec_helper'

describe Tag do

  let(:tag) { FactoryGirl.create(:tag) }

  it 'should not be valid without a name' do

    tag = Tag.create

    expect(tag).not_to be_valid
    expect(Tag.count).to be 0

  end

  it 'should not be valid without a unique name' do

    tag
    invalid_tag = Tag.create(:name => tag.name)

    expect(invalid_tag).not_to be_valid
    expect(Tag.count).to be 1

  end

  it 'should be valid and saved with a name' do

    expect(tag).to be_valid
    expect(Tag.count).to be 1

  end

  it 'should destroy orphan tags' do

    tag

    expect(Tag.count).to be 1
    expect { Tag.destroy_orphans }.to change(Tag, :count).by -1

  end

  it 'to_s should return tag name' do

    expect(tag.to_s).to be tag.name

  end

end
