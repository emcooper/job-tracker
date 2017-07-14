RSpec.feature "User deletes a job" do
  scenario "user can delete a job" do
    company = create(:company)
    job1 = create(:job, company: company)
    job1 = create(:job, company: company)

    visit("/companies/#{company.id}/jobs/#{job1.id}")
    click_link "Delete"

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to_not have_content("job1.name")
    expect(page).to_not have_content("job2.name")
  end
end
