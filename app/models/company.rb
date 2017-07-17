class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def index_tag
    "index-name #{self.class.name.downcase}_#{id}"
  end

  def self.top_by_interest
    Company.all.max_by(3) {|company| company.average_level_of_interest}
  end

  def average_level_of_interest
    self.jobs.average(:level_of_interest)
  end
end
