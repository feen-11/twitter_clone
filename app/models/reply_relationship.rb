class ReplyRelationship < ApplicationRecord
  belongs_to :replied, class_name: 'Post'
  belongs_to :replying, class_name: 'Post'
end
