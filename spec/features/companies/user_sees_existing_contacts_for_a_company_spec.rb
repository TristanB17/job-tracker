require 'rails_helper'

describe 'user sees company contacts' do
  it 'can view all attributes' do
    company = Company.create(name: 'Spector')
    contact_1 = Contact.create(name: 'Auric Goldfinger', position: 'Gold Magnate', email: 'ilovegold@goldbod.com', company_id: 1)
    contact_1 = Contact.create(name: 'Dr. Julius No', position: 'Mad Scientist', email: 'myhandsaremetal@imelted.com', company_id: 1)

    

  end
end
