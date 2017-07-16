RSpec.feature "User creates new comment" do
  scenario "and views comment on job show page" do
    job = create(:job)
    visit("/companies/#{job.company.id}/jobs/#{job.id}")

    fill_in "comment_content", with: "Got the job = )"
    click_on "Create Comment"

    expect(current_path).to eq("/companies/#{job.company.id}/jobs/#{job.id}")
    expect(page).to have_content("Got the job = )")
  end
end
