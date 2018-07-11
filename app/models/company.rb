class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.company_by_interest
    select('companies.*, avg(jobs.level_of_interest) AS average_interest_level')
    .joins(:jobs)
    .group(:company_id, :id)
    .order('average_interest_level DESC')
    .limit(3)
  end
end
