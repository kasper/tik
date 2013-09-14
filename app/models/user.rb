class User < ActiveRecord::Base

  belongs_to :team
  has_many :tasks, :foreign_key => 'owner_id'

end
