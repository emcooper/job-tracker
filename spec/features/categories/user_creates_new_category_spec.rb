RSpec.feature "User creates new category" do
    scenario "the category is created" do
      visit new_category_path
      fill_in "category_title", with: "Finance"
      click_on "Create Category"

      expect(current_path).to eq(category_path(Category.last))
      expect(page).to have_content("Finance")
      expect(Category.count).to eq(1)
    end
  end
