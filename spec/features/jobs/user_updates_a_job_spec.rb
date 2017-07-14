RSpec.feature "User updates a job" do
  scenario "user can edit a job" do
    job = create(:job)

    visit("/companies/#{job.company.id}/jobs/#{job.id}")
    click_on "Edit"
    fill_in "job_title", with: "new title"
    fill_in "job_level_of_interest", with: "27"
    click_on "Update Job"

    expect(page).to have_content("new title")
    expect(page).to have_content("Level of Interest: 27")
    expect(page).to have_content(job.description)
    expect(page).to_not have_content("Level of Interest: 100")
    expect(current_path).to eq("/companies/#{job.company.id}/jobs/#{job.id}")
  end
end
