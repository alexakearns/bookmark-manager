# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark'

# The class for Sinatra to use
class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/bookmarks' do
    Bookmark.create(params[:url], params[:title])
    redirect('/bookmarks')
  end

  get '/bookmarks/new' do
    erb :'bookmarks/add_bookmark'
  end
end
