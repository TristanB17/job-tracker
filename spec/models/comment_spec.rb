require 'rails_helper'

describe Comment do
  describe 'Validations' do
    it 'is invalid without a message' do
      comment = Comment.new(job_id: 2)

      expect(comment).to_not be_valid
    end

    it 'is invalid without a job id' do
      comment = Comment.new(message: "blah")

      expect(comment).to_not be_valid
    end
  end
  describe 'Relationships' do
    it {should belong_to(:job)}
  end
end
