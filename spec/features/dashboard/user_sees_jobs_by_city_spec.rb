require 'rails_helper'

describe 'a user' do
  describe 'visits dashboard' do
    it 'sees a jobs by city' do
      company_1 = Company.create(name: 'WHELP!')
      company_2 = Company.create(name: 'Maybe')
      company_3 = Company.create(name: 'Save Me')
      category = Category.create(title: 'Namekian')
      job_1 = Job.create!(title: 'Developer',
                          description: 'something',
                          level_of_interest: 4,
                          company_id: company_1.id,
                          category_id: category.id,
                          city: "Bratislava")
      job_2 = Job.create!(title: 'Another Dev',
                          description: 'something',
                          level_of_interest: 3,
                          company_id: company_1.id,
                          category_id: category.id,
                          city: "Belgrade")
      job_3 = Job.create!(title: 'Ombudsman',
                          description: 'something else',
                          level_of_interest: 4,
                          company_id: company_2.id,
                          category_id: category.id,
                          city: "Beirut")
      job_4 = Job.create!(title: 'Sven',
                          description: 'Sweden',
                          level_of_interest: 5,
                          company_id: company_2.id,
                          category_id: category.id,
                          city: "Belgrade")
      job_5 = Job.create!(title: 'Another Pev',
                          description: 'something',
                          level_of_interest: 3,
                          company_id: company_3.id,
                          category_id: category.id,
                          city: "Limon")
      location_1 = job_1.city
      location_2 = job_2.city

      visit dashboard_path

      expect(page).to have_link(location_1)
      expect(page).to have_link(location_2)
    end
  end
end
