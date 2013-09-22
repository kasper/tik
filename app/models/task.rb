class Task < ActiveRecord::Base

  validates :description, :presence => true
  validates :creator_id, :presence => true
  validates :owner_id, :presence => true

  belongs_to :creator, :class_name => 'User'
  belongs_to :owner, :class_name => 'User'

  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

  after_destroy :destroy_orphaned_tags

  def destroy_orphaned_tags

    Tag.destroy_orphans

  end

end
