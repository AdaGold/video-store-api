JSON.parse(File.read('db/seeds/customers.json')).each do |customer|
  Customer.create!(customer)
end

puts "The database now has #{Customer.count} customers"

JSON.parse(File.read('db/seeds/videos.json')).each do |video|
  Video.create!(video)
end

puts "The database now has #{Video.count} videos"