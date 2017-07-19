class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :article

  validates :comment, length: {minimum: 10, maximum: 1000}

end