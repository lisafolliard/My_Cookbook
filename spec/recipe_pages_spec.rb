require('spec_helper')

describe('path to view individual recipe page', :type => :feature) do
  it('adds and displays new recipes') do
    visit('/recipes')
    fill_in('name', :with => 'beef bourguignon')
    click_button('Add!')
    expect(page).to have_content('Beef bourguignon')
  end
end

# describe('view the details of a recipe', :type => :feature) do
#   it('select and view ingredients of a specific recipe') do
#     visit('/recipes')
#     check('tempeh')
#     click_button('Add ingredients!')
#     expect(page).to have_contect('tempeh')
#   end
# end
