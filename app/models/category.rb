class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :jobs

  def self.titles
    Category.all.pluck("title")
  end
end
