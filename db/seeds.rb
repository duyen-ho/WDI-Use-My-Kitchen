# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Note - Before Running - do:  1.  rails db:drop    2.   rails db:create    3.  rails db:migrate



user_names_arr = ['DT', 'Harry', 'Kasun','test4','test5','test6','test7','test8','test9','test10']

emails = [
  'dt@ga.com',
  'harry@ga.com',
  'kasun@ga.com',
  'test4@ga.com',
  'test5@ga.com',
  'test6@ga.com',
  'test7@ga.com',
  'test8@ga.com',
  'test9@ga.com',
  'test10@ga.com'
]

passwords = [
  'dt@ga.com',
  'harry@ga.com',
  'kasun@ga.com',
  'test4@ga.com',
  'test5@ga.com',
  'test6@ga.com',
  'test7@ga.com',
  'test8@ga.com',
  'test9@ga.com',
  'test10@ga.com'
]

user_image_url = ['http://www.clker.com/cliparts/A/Y/O/m/o/N/placeholder-hi.png']

addresses_arr = [
  '11 King St',
  '22 William St',
  '33 Queen St',
  '44 Elizabeth St',
  '55 Willam St',
  '66 Church St',
  '77 Bridge Rd',
  '88 Smith St',
  '99 Johnson St',
  '100 Church St'
]

suburbs_arr = [
  'Melbourne',
  'Melbourne',
  'Melbourne',
  'Melbourne',
  'Melbourne',
  'Richmond',
  'Richmond',
  'Collingwood',
  'Collingwood',
  'Richmond'
]
postcodes_arr = [
  '3000',
  '3000',
  '3000',
  '3000',
  '3000',
  '3121',
  '3121',
  '3066',
  '3066',
  '3121'
]

kitchen_description_arr = [
  'Huge Ovens and Fridge',
  'Great Evironment',
  'Modern Luxury Kitchen',
  'Enormous!!!',
  'Elfresco Dining at its finest',
  'Three Fridges and Two Ovens',

  'Quality European Appliances',
  '900mm gas oven plus deluxe Steam Oven',
  '8 burners in beautiful outdoor kitchen',
  'Rustic Feel with Modern Appliances'
]

kitchen_titles_arr = [
  'Awesome Appliances',
  'Best Kitchen in Melbourne',
  'You will love this',
  'You will not believe your eyes',
  'Seamless Indoor and Outdoor',
  'Enormous, impress your friends',
  'Quality City',
  'Ideal for Asian Cuisine',
  'Great for Summer Nights',
  'Rustic Charm and Quality'
]

  kitchen_photo_url_arr = [
    'http://aytigo.com/wp-content/uploads/2016/09/Awesome-kitchen-appliances-india-for-Interior-Designing-Home-Ideas-with-kitchen-appliances-india.jpg',
    'https://s-media-cache-ak0.pinimg.com/564x/e9/9f/87/e99f878280f3d78b7cb670aa3cb4d83b.jpg',
    'https://st.hzcdn.com/fimgs/68e1aefc0caec243_1909-w500-h400-b0-p0--traditional-kitchen.jpg',
    'http://nicenup.com/wp-content/uploads/2016/08/big-kitchen-design-ideas-and-kitchen-island-designs-perfected-by-fascinating-surroundings-of-your-Kitchen-with-really-great-concept-of-ornaments-formation-14.jpg',
    'https://www.google.com.au/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwi23v2E5sDQAhVJTbwKHQIGARIQjRwIBw&url=http%3A%2F%2Fwww.houzz.com%2Fcovered-outdoor-kitchen&psig=AFQjCNF2RZCFmNELiK9rxOfAy-dMls8DfA&ust=1480056417823174',
    'https://s-media-cache-ak0.pinimg.com/originals/57/01/0a/57010a200c7ba57886906ad050e259c1.jpg',
    'http://weebitphotography.com/wp-content/uploads/2016/06/popular-large-kitchen-pictures-cool-ideas-for-you.jpg',
    'http://www.bosch-home.com.au/Files/Bosch2/SharedContents/products/cooking_baking/Steam_appliances/_built-in/548x300_L_AttentionOfSteamers.jpg',
    'https://images.lowes.ca/img/x/13278/outdoor-kitchen_bbq_lifestyle.jpg',
    'http://d31eqxppr3nlos.cloudfront.net/wp-content/uploads/2014/04/11.jpg'
  ]

    user_description_arr = [
      'Future MasterChef',
      'My Kitchen Code Rules',
      'Up and coming cooker of code',
      'Champion Cook',
      'Tiny Tim Kitchen Cook',
      'Cramped Would be Chef',
      'Looking for BIG kitchens',
      'Just luv to cook',
      'Asian cooking genius',
      'Cook with potential'
    ]

    booking_dates_arr = [
      Date.new(2016, 10, 01),
      Date.new(2016, 10, 07),
      Date.new(2016, 10, 14),
      Date.new(2016, 10, 22),
      Date.new(2016, 11, 11),
      Date.new(2016, 11, 12),
      Date.new(2016, 11, 18),
      Date.new(2016, 11, 25),
      Date.new(2016, 11, 26),
      Date.new(2016, 12, 2)
    ]

    bookings_fee_arr= [
      100,
      200,
      300,
      400,
      500,
      600,
      700,
      800,
      900,
      1000
    ]

users = []
kitchens = []
bookings = []

# kitchen_photos = []

User.delete_all
Kitchen.delete_all
KitchenPhoto.delete_all

10.times do |i|
  user = User.new
  user.name = user_names_arr[i]
  user.email = emails[i]
  user.password = passwords[i]
  user.photo_url = 'http://www.clker.com/cliparts/A/Y/O/m/o/N/placeholder-hi.png'
  user.description = user_description_arr[i]
  user.save
  users.push(user)
end

10.times do |i|
  kitchen = Kitchen.new
  kitchen.address = addresses_arr[i]
  kitchen.suburb = suburbs_arr[i]
  kitchen.state = 'Vic'
  kitchen.postcode = postcodes_arr[i]
  kitchen.country = 'Australia'
  kitchen.description = kitchen_description_arr[i]
  kitchen.capacity = i + 7
  kitchen.fee = i * 100
  kitchen.title = kitchen_titles_arr[i]
  kitchen.user_id = users[i].id
  kitchen.save
  kitchens.push(kitchen)
end

10.times do |i|
  kitchen_photo = KitchenPhoto.new
  kitchen_photo.image_url = kitchen_photo_url_arr[i]
  kitchen_photo.kitchen_id = kitchens[i].id
  kitchen_photo.save
  # kitchen_photos.push(kitchen_photos)
end
