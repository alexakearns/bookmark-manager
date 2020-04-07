# frozen_string_literal: true

feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'bookmarks page has a list of bookmarks' do
    Bookmark.create('http://www.google.com', 'Google')
    Bookmark.create('http://www.destroyallsoftware.com', 'Destroy All Software')
    Bookmark.create('http://www.makersacademy.com', 'Makers Academy')
    
    visit('/')
    click_button 'View all'
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
    expect(page).to have_content 'http://www.google.com'
  end
end
