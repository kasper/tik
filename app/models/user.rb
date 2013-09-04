class User < ActiveRecord::Base

  has_many :tasks, :foreign_key => 'owner_id'

end
