class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :commenter, foreign_key: 'user_id', class_name: 'User'

  validates :body, presence: true
end
