require 'rails_helper'

describe Contact, type: :model do
  describe 'Validations' do
    it 'is invalid without a full name' do
      contact = Contact.create(position: 'Lion-Tamer', email: 'notreal@fake.com', company_id: 12)

      expect(contact).to_not be_valid
    end
    it 'is invalid without a position' do
      contact = Contact.create(name: 'Jennifer Anniston', email: 'notreal@fake.com', company_id: 12)

      expect(contact).to_not be_valid
    end
    it 'is invalid without an email' do
      contact = Contact.create(name: 'Jennifer Gardner', position: 'Lion-Tamer', company_id: 12)

      expect(contact).to_not be_valid
    end
    it 'is invalid without a company id' do
      contact = Contact.create(name: 'Jennifer Lopez', position: 'Lion-Tamer', email: 'notreal@fake.com')

      expect(contact).to_not be_valid
    end
    it 'is valid with all attributes' do
      company = Company.create(name: 'Cheeze-Whiz Inc.')
      contact = Contact.create(name: 'Jennifer Love-Hewitt', position: 'Lion-Tamer', email: 'notreal@fake.com', company_id: 1)

      expect(contact).to be_valid
    end
  end
  describe 'relationships' do
    it {should belong_to(:company)}
  end
end
