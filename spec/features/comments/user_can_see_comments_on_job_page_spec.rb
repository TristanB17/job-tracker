require 'rails_helper'

describe 'Visitor' do

  it 'user can see comments on job page' do
    company = Company.create(name: "Turing")
    job_1 = company.jobs.create(title: 'Dev',
                       description: 'something',
                       level_of_interest: 5,
                       city: "Moscow")
    comment_1 = job_1.comments.create(message: "Blah")

    visit job_path(job_1)

    expect(page).to have_content(comment_1.message)
  end

end
