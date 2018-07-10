class Comment < ApplicationRecord
  validates_presence_of :job_id, :message
  belongs_to :job
end
