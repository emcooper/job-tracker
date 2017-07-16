RSpec.feature "User visits individual jobs page" do
  scenario "and sees comments in order created" do
    job = create(:job)
    comment1 = create(:comment, job: job)
    comment2 = create(:comment, job: job)
    comment3 = create(:comment, job: job, created_at: 2.days.ago)
    comment4 = create(:comment)

    visit("/companies/#{job.company.id}/jobs/#{job.id}")

    expect(comment3.content).to appear_before(comment1.content)
    expect(comment1.content).to appear_before(comment2.content)
    expect(page).to_not have_content(comment4.content)
  end
end
