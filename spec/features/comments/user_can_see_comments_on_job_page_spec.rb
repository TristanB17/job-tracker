require 'rails_helper'

describe 'Visitor' do

  it 'user can see a comment on job page' do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "asdf")
    job_1 = company.jobs.create(title: 'Developer',
                       description: 'something',
                       level_of_interest: 5,
                       category_id: category.id,
                       city: "Moscow")
    comment_1 = job_1.comments.create(message: "Blah")

    visit job_path(job_1)

    expect(page).to have_content(comment_1.message)
  end

  it 'user can add a comment from job page' do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "asdf")
    job_1 = company.jobs.create(title: 'Developer',
                       description: 'something',
                       level_of_interest: 5,
                       category_id: category.id,
                       city: "Moscow")
    comment_1 = job_1.comments.create(message: "Blah")

    visit job_path(job_1)

    message = "More blah"

    fill_in "comment[message]", with: message
    click_on("Create Comment")

    expect(current_path).to eq(job_path(job_1))
    expect(page).to have_content(message)
  end

  it 'user can view comments in order of most recently created' do

  end

end
