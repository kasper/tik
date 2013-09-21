class Tag < ActiveRecord::Base

  validates :name, :presence => true
  validates_uniqueness_of :name

  has_many :taggings, :dependent => :destroy
  has_many :tasks, :through => :taggings

  def to_s

    name

  end

end
