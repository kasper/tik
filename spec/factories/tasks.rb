FactoryGirl.define do

  factory :task do

    description 'Create a new task'
    association :creator, :factory => :user
    association :owner, :factory => :user2

  end

end
