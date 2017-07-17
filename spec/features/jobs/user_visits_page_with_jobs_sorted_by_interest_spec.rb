RSpec.feature "User visits page with jobs sorted by location" do
  scenario "sees jobs sorted by location" do
    job1, job2 = create_list(:job, 2, level_of_interest: 50)
    job3 = create(:job, level_of_interest: 5)
    visit("/dashboard")
    click_on "Jobs by Interest"

    expect(current_path).to eq("/jobs")

    within(".criteria_50") do
      expect(page).to have_content(job1.title)
      expect(page).to have_content(job2.title)
      expect(page).to_not have_content(job3.title)
    end
    within(".criteria_5") do
      expect(page).to_not have_content(job1.title)
      expect(page).to_not have_content(job2.title)
      expect(page).to have_content(job3.title)
    end
  end
end
