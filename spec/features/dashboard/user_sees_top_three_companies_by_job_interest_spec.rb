require 'rails_helper'

describe 'a user' do
  describe 'visits the dashboard' do
    it 'sees top three companies by job interest' do
      company_1 = Company.create(name: 'WHELP!')
      company_2 = Company.create(name: 'Maybe')
      company_3 = Company.create(name: 'Save Me')
      category = Category.create(title: 'Namekian')
      job_1 = Job.create!(title: 'Developer',
                          description: 'something',
                          level_of_interest: 4,
                          company_id: company_1.id,
                          category_id: category.id,
                          city: "Moscow")
      job_2 = Job.create!(title: 'Another Dev',
                          description: 'something',
                          level_of_interest: 3,
                          company_id: company_1.id,
                          category_id: category.id,
                          city: "Moscow")
      job_3 = Job.create!(title: 'Ombudsman',
                          description: 'something else',
                          level_of_interest: 4,
                          company_id: company_2.id,
                          category_id: category.id,
                          city: "Moscow")
      job_4 = Job.create!(title: 'Sven',
                          description: 'Sweden',
                          level_of_interest: 5,
                          company_id: company_2.id,
                          category_id: category.id,
                          city: "Moscow")
      job_5 = Job.create!(title: 'Another Pev',
                          description: 'something',
                          level_of_interest: 3,
                          company_id: company_3.id,
                          category_id: category.id,
                          city: "Moscow")
      expected_first = company_2.name
      first_average = 4.5

      visit dashboard_path

      expect(page).to have_content(expected_first)
      expect(page).to have_content(first_average)
    end
  end
end
