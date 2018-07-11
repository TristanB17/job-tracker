class Job < ApplicationRecord
  validates :title, :level_of_interest, :description, :city, :company_id, :category_id, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def order_comments
    comments.order(updated_at: :desc)
  end

  def self.by_interest_level
    group(:level_of_interest).count
  end

  
end
