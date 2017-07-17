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

  scenario "sees top three companies ranked by average level of interest and averages" do
    co1 = create(:company, :with_2_jobs_averaging_60_loi)
    co2 = create(:company, :with_3_jobs_averaging_50_loi)
    co3 = create(:company, :with_3_jobs_averaging_80_loi)
    co4 = create(:company, :with_2_jobs_averaging_30_loi)
    visit ("/dashboard")
  
    expect("#{co3.name}").to appear_before("#{co1.name}")
    expect("#{co1.name}").to appear_before("#{co2.name}")
    expect(page).to_not have_content(co4.name)
  end
end
