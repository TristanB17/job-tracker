require 'rails_helper'

describe 'User' do
  describe 'visits contacts/new and' do
    it 'sees a create new contact form' do
      company = Company.create(name: "Roxxon")

      visit new_company_contact_path(company)

      expect(page).to have_content("Create New Contact for #{company.name}")
      expect(page).to have_field(:contact_name)
      expect(page).to have_field(:contact_position)
      expect(page).to have_field(:contact_email)
      expect(page).to have_button('Create Contact')
    end
    it 'creates a new contact for a company' do
      name = 'Soulja Boi'
      position = 'YOOOOOOUUUUU'
      email = 'crankdat@awwwww.com'
      company = Company.create(name: "Roxxon")


      visit new_company_contact_path(company)

      fill_in :contact_name, with: name
      fill_in :contact_position, with: position
      fill_in :contact_email, with: email
      select company.name, from: :contact_company_id
      click_on 'Create Contact'

      expect(current_path).to eq(company_jobs_path(company))
      expect(page).to have_content(name)
      expect(page).to have_content(position)
      expect(page).to have_content(email)
    end
  end
end
