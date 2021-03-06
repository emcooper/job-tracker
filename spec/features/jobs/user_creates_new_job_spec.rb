require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create!(name: "ESPN")
    category = create(:category, title: "Technology")
    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    select "Technology", :from => "job_category_id"

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Technology")
  end

  scenario "and can create a new category" do
    company = Company.create!(name: "ESPN")
    category = create(:category, title: "Technology")

    visit new_company_job_path(company)
    click_on "New Category"
    fill_in "category_title", with: "Human Resources"
    click_on "Create Category"
    visit new_company_job_path(company)

    expect(page).to have_content("Human Resources")
  end
end
