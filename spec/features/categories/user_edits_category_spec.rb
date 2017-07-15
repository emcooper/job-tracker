RSpec.feature "User edits a category" do
  scenario "with valid name category is updated" do
    category = create(:category, title: "Finance")
    visit("/categories")
    within(".category_#{category.id}") do
      click_link "Edit"
    end
    fill_in "category_title", with: "Tech"
    click_button "Update Category"

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("Tech")
    expect(page).to_not have_content("Finance")
  end
  scenario "with invalid name category is not updated" do
    create(:category, title: "Tech")
    category = create(:category, title: "Finance")
    visit("/categories")
    within(".category_#{category.id}") do
      click_link "Edit"
    end
    fill_in "category_title", with: "Tech"
    click_button "Update Category"

    expect(current_path).to eq("/categories/#{category.id}/edit")
    expect(page).to have_content("Finance")
  end
end
