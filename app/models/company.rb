class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy

  def index_tag
    "index-name #{self.class.name.downcase}_#{id}"
  end
end
