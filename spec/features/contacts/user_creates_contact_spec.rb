RSpec.feature "User creates new contact" do
  scenario "user is able to create new contact" do
    company = create(:company)

    visit("/companies/#{company.id}/jobs")
    fill_in "contact_name", with: "Dwight Schrute"
    fill_in "contact_position", with: "Assistant to the Regional Manager"
    fill_in "contact_email", with: "dwight@dunder.com"
    click_on "Create Contact"

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("Dwight Schrute")
    expect(page).to have_content("Assistant to the Regional Manager")
    expect(page).to have_content("dwight@dunder.com")
  end
end
