require('spec_helper')

describe('path to view individual recipe page', :type => :feature) do
  it('adds and displays new recipes') do
    visit('/recipes')
    fill_in('name', :with => 'beef bourguignon')
    click_button('Add!')
    expect(page).to have_content('beef bourguignon')
  end
end

describe('path to view individual ingredient page', :type => :feature) do
  it('adds and displays new ingredients') do
    visit('/ingredients')
    fill_in('description', :with => 'tempeh')
    click_button('Add!')
    expect(page).to have_content('tempeh')
  end
end
