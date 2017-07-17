RSpec.feature "User visits page with jobs sorted by location" do
  scenario "sees jobs sorted by location" do
    job1, job2 = create_list(:job, 2, city: "Denver")
    job3 = create(:job, city: "Chicago")
    visit("/dashboard")
    click_on "Jobs by Location"

    expect(current_path).to eq("/jobs")
    within(".Denver") do
      expect(page).to have_content(job1.title)
      expect(page).to have_content(job2.title)
      expect(page).to_not have_content(job3.title)
    end
    within(".Chicago") do
      expect(page).to_not have_content(job1.title)
      expect(page).to_not have_content(job2.title)
      expect(page).to have_content(job3.title)
    end
  end
end
