RSpec.feature "User visits individual jobs page" do
  scenario "and sees comments" do
    comment = create(:comment)

    visit("/companies/#{comment.job.company.id}/jobs/#{comment.job.id}")

    expect(page).to have_content(comment.content)
  end
end
