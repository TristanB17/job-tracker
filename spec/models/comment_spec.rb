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
  describe 'Methods' do
    it 'can order comments by date created' do
      company = Company.create(name: "ESPN")
      category = Category.create(title: "asdf")
      job_1 = company.jobs.create(title: 'Developer',
                         description: 'something',
                         level_of_interest: 5,
                         category_id: category.id,
                         city: "Moscow")
      comment_1 = job_1.comments.create(message: "Blah")
      comment_2 = job_1.comments.create(message: "This is first")

      actual = job_1.order_comments
      expected_array = [comment_2, comment_1]

      expect(actual).to eq(expected_array)

    end
  end
end
