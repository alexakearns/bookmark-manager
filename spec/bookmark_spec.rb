# frozen_string_literal: true

require 'bookmark'

describe Bookmark do

  describe '#all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com'), ('http://www.destroyallsoftware.com'), ('http://www.google.com');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end

  describe '#create' do
    it 'adds a bookmark to the bookmarks' do
      Bookmark.create('http://www.rockpapershotgun.com')
      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.rockpapershotgun.com')
    end
  end
end
