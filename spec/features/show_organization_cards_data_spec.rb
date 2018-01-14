require 'rails_helper'

RSpec.feature 'show organization cards data' do
  before do
    stub_request(:post, "#{ENV['PIPEFY_URL']}/queries").to_return(
      body: load_fixture_file('requests/pipefy_organization.json'),
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  scenario 'does not display the data on the page load' do
    visit '/organizations'

    expect(page).not_to have_content('Pipefy Recruitment Test')
    expect(page).not_to have_content('Back-end Test')
    expect(page).not_to have_css('table')
  end

  scenario 'display the organization and cards data after the fetch new data button is clicked' do
    visit '/organizations'

    click_on 'Fetch new data'

    expect(page).to have_content('Pipefy Recruitment Test')
    expect(page).to have_content('Back-end Test')
    expect(page).to have_content('Missing translation on open card')
  end
end

def load_fixture_file(path)
  full_path = Rails.root.join('spec/fixtures', path)
  File.read(full_path)
end
