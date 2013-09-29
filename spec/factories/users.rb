FactoryGirl.define do

  factory :user do

    username 'kasper'
    password 'repsak44'
    password_confirmation 'repsak44'
    team

  end

  factory :user2, :class => User do

    username 'jack'
    password 'kcaj2222'
    password_confirmation 'kcaj2222'
    team

  end

end
