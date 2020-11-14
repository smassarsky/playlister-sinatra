class Artist < ActiveRecord::Base
  has_many :songs
  has_many :song_genres, through: :songs
  has_many :genres, through: :song_genres

  def slug
    self.name.split(" ").map{|word| word.sub(/\W/, "")}.join("-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find{|artist| artist.slug == slug}
  end

end