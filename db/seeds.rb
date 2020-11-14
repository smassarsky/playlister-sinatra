Song.destroy_all
Artist.destroy_all
Genre.destroy_all

s1 = Song.create(name: "Sweet Child O' Mine")
s2 = Song.create(name: "House Of The Rising Sun")
s3 = Song.create(name: "Up Around The Bend")
s4 = Song.create(name: "American Idiot")

a1 = Artist.create(name: "Guns N' Roses")
a2 = Artist.create(name: "The Animals")
a3 = Artist.create(name: "Creedence Clearwater Revival")
a4 = Artist.create(name: "Green Day")

g1 = Genre.create(name: "Rock And Roll")
g2 = Genre.create(name: "Pop-punk")

s1.artist = a1
s2.artist = a2
s3.artist = a3
s4.artist = a4

s1.genres << g1
s2.genres << g1
s3.genres << g1
s4.genres << g2

s1.save
s2.save
s3.save
s4.save
