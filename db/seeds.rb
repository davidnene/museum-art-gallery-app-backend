require 'rest-client'
require 'json'

puts "🌱 Seeding arts..."

response = RestClient.get "https://api.artic.edu/api/v1/artworks?page=2&limit=100"

arts_hash = JSON.parse(response)



arts_data = arts_hash['data']

arts_data.each do |art|
    art_thumbnail = if art['thumbnail'] != nil
        art.fetch('thumbnail').fetch('alt_text')
    end
    new_art = Art.create(
        art_id: art['id'],
        title: art['title'],
        img_url: "https://www.artic.edu/iiif/2/#{art['image_id']}/full/843,/0/default.jpg",
        artwork_type_title: art['artwork_type_title'],
        alt_text: art_thumbnail,
        have_not_been_viewed_much: art['thumbnail'],
        artist_title: art['artist_title'],
        date_start: art['date_start'],
        date_end: art['date_end']
    )
end
puts "✅ Done seeding!"
