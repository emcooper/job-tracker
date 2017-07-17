RSpec.feature "User visits dashboard" do
  scenario "sees count of jobs by interest" do
    job1, job2 = create_list(:job, 2, level_of_interest: 50)
    job3 = create(:job, level_of_interest: 5)
    visit("/dashboard")

    expect(page).to have_content("Interest Level 50: 2")
    expect(page).to have_content("Interest Level 5: 1")
  end
  scenario "sees count of jobs by city" do
    job1, job2 = create_list(:job, 2, city: "Denver")
    job3 = create(:job, city: "Chicago")
    visit("/dashboard")

    expect(page).to have_content("Denver: 2 jobs")
    expect(page).to have_content("Chicago: 1 jobs")
  end
  scenario "can click on city count link and see all jobs matching city" do
    job1, job2 = create_list(:job, 2, city: "Denver")
    job3 = create(:job, city: "Chicago")
    visit("/dashboard")
    click_on "Denver: 2 jobs"

    expect(page).to have_content(job1.title)
    expect(page).to have_content(job2.title)
    expect(page).to_not have_content(job3.title)
  end
end
