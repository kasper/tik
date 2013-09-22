class Tagging < ActiveRecord::Base

  belongs_to :tag
  belongs_to :task

  after_destroy :destroy_orphaned_tags

  def destroy_orphaned_tags

    Tag.destroy_orphans

  end

end
