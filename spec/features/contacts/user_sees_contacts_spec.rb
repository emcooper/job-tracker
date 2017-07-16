RSpec.feature "User sees contacts" do
  scenario "on individual company page" do
    company = create(:company)
    contact1, contact2 = create_list(:contact, 2, company: company)

    visit ("/companies/#{company.id}")

    expect(page).to have_content(contact1.name)
    expect(page).to have_content(contact2.name)
  end
end
