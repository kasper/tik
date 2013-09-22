class Tag < ActiveRecord::Base

  validates :name, :presence => true
  validates_uniqueness_of :name

  has_many :taggings, :dependent => :destroy
  has_many :tasks, :through => :taggings

  def self.destroy_orphans

    Tag.all.each do |tag|

      tag.destroy if tag.tasks.empty?

    end

  end

  def to_s

    name

  end

end
