class User < ActiveRecord::Base

  has_secure_password

  validates_uniqueness_of :username
  validates_length_of :username, :minimum => 3, :maximum => 15
  validates_length_of :password, :minimum => 8

  belongs_to :team
  has_many :created_tasks, :class_name => 'Task', :foreign_key => 'creator_id', :dependent => :destroy
  has_many :tasks, :foreign_key => 'owner_id', :dependent => :destroy

end
