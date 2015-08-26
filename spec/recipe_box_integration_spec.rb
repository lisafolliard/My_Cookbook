require('spec_helper')

describe('path to view individual recipe page', :type => :feature) do
  it('adds and displays new recipes') do
    visit('/recipes')
    fill_in('name', :with => 'beef bourguignon')
    click_button('Add!')
    expect(page).to have_content('beef bourguignon')
  end
end
