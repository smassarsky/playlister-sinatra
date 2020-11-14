class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    song = Song.new(params[:song])
    artist = Artist.find_by_name(params[:artist_name])
    if artist
      song.artist = artist
    else
      song.artist = Artist.new(name: params[:artist_name])
    end
    song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    artist = Artist.find_by_name(params[:artist_name])
    if artist
      song.artist = artist
    else
      song.artist = Artist.new(name: params[:artist_name])
    end
    song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end  

end
