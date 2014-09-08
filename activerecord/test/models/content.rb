class Content < ActiveRecord::Base
  self.table_name = 'content'
  has_one :content_position, dependent: :destroy

  def self.destroyed_ids
    @destroyed_ids ||= []
  end

  before_destroy do |object|
    Content.destroyed_ids << object.id
    true
  end
end

class ContentPosition < ActiveRecord::Base
  belongs_to :content, dependent: :destroy

  def self.destroyed_ids
    @destroyed_ids ||= []
  end

  before_destroy do |object|
    ContentPosition.destroyed_ids << object.id
    true
  end
end