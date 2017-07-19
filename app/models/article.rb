class Article < ActiveRecord::Base

  belongs_to :user
  has_many :comments
  has_many :article_categories
  has_many :categories, through: :article_categories

  validates :title, presence: true, length: {minimum: 1, maximum: 50}
  validates :description, presence: true, length: {minimum: 1, maximum: 100000}
  validate :has_category


  def has_category
    errors.add(:base, 'Must have at least one category') if self.categories.blank?
  end

end