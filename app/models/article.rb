class Article < ActiveRecord::Base

  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories

  validates :title, presence: true, length: {minimum: 1, maximum: 50}
  validates :description, presence: true, length: {minimum: 1, maximum: 100000}

end