class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  has_many :comments, dependent: :destroy

  def order_comments
    comments.order(updated_at: :desc)
  end
end
