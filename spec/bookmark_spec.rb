# frozen_string_literal: true

require 'bookmark'

describe Bookmark do

  describe '#all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.makersacademy.com', 'Makers Academy'), ('http://www.destroyallsoftware.com', 'Destroy All Software'), ('http://www.google.com', 'Google');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include('http://www.makersacademy.com Makers Academy')
      expect(bookmarks).to include('http://www.destroyallsoftware.com Destroy All Software')
      expect(bookmarks).to include('http://www.google.com Google')
    end
  end

  describe '#create' do
    it 'adds a bookmark to the bookmarks' do
      Bookmark.create('http://www.rockpapershotgun.com', 'RockPaperShotgun')
      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.rockpapershotgun.com RockPaperShotgun')
    end
  end
end
