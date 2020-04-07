# frozen_string_literal: true
require 'pg'

class Bookmark
  def self.all
    connection = connect_to_correct_db
    result = connection.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| bookmark['url'] + ' ' + bookmark['title']}
  end

  def self.create(url, title)
    connection = connect_to_correct_db
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}');")
  end

  def self.connect_to_correct_db
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'bookmark_manager_test')
    else 
      PG.connect(dbname: 'bookmark_manager')
    end
  end
end
