feature 'add bookmarks to the app' do
  scenario 'button on homepage takes you to add bookmark form' do
    visit '/'
    click_button 'Add bookmark'
    expect(page).to have_content 'Add bookmark'
  end

  scenario 'adding a bookmark means we can see it on the full list' do
    visit '/bookmarks/new'
    fill_in 'url', with: 'http://www.rockpapershotgun.com'
    fill_in 'title', with: 'RockPaperShotgun'
    click_button 'Add'
    expect(page).to have_content 'RockPaperShotgun'
  end
end
