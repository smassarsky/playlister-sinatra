class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.split(" ").map{|word| word.sub(/\W/, "")}.join("-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find{|artist| artist.slug == slug}
  end

end