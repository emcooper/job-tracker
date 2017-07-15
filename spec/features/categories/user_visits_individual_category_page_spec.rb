RSpec.feature "User visits individual category page" do
  scenario "and sees list of jobs in category" do
    category = create(:category)
    job1, job2 = create_list(:job, 2, category: category)
    job3 = create(:job)
    visit("/categories/#{category.id}")

    expect(page).to have_content(category.title)
    expect(page).to have_content(job1.title)
    expect(page).to have_content(job2.title)
    expect(page).to_not have_content(job3.title)
  end
end
