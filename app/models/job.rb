class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category, optional: true
  has_many :comments

  def column_names
    [:title, :description, :level_of_interest, :city]
  end

  def self.sort(criteria)
    result = {}
    criteria = convert_to_attribute_name(criteria)
    Job.pluck(criteria).uniq.sort.each do |value|
      result[value] = Job.where("#{criteria}": value)
    end
    return result
  end

  def self.convert_to_attribute_name(criteria)
    return "city" if criteria == "location"
    return "level_of_interest" if criteria == "interest"
  end
end
