require 'spec_helper'

describe Tagging do

  let(:tagging) { FactoryGirl.create(:tagging) }

  it 'should be valid' do

    expect(tagging).to be_valid
    expect(Tagging.count).to be 1

  end

  it 'destroy should destroy orphan tags' do

    tagging.tag

    expect(Tag.count).to be 1
    expect { tagging.destroy }.to change(Tag, :count).by -1

  end

end
