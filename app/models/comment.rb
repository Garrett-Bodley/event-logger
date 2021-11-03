class Comment < ApplicationRecord
  belongs_to :event
  validates :name, presence: { message: "You must provide a name" }
  validates :content, presence: { message: "Comment content cannot be blank" }
end
