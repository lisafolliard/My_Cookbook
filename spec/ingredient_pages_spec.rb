require('spec_helper')

describe('path to view individual ingredient page', :type => :feature) do
  it('adds and displays new ingredients') do
    visit('/ingredients')
    fill_in('description', :with => 'tempeh')
    click_button('Add!')
    expect(page).to have_content('Tempeh')
  end
end
