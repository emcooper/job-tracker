class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company

  def column_names
    [:title, :description, :level_of_interest, :city]
  end
end
