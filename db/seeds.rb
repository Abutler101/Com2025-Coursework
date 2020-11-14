# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def openAsset(filename)
  File.open(Rails.root.join('db', 'seedAssets', filename))
end

sect1 = Section.find_or_create_by! name: 'Clothes'
sect2 = Section.find_or_create_by! name: 'Food'
sect3 = Section.find_or_create_by! name: 'Transport'

Product.destroy_all

sect1.products.create!({
                           name: "I heart Rails T-shirt",
                           description: "Unisex I hear rails shirt. So hideous, your preference of web frameworks won't
                                         be the main reason people avoid you anymore",
                           stockCount: 20,
                           pricePence: 772,
                           image: openAsset("Clothes1.png")
                       })
sect1.products.create!({
                           name: "Short shorts",
                           description: "Pair with rails shirt for an iconic unforgettable look",
                           stockCount: 10,
                           pricePence: 7072,
                           image: openAsset("Clothes2.png")
                       })
sect1.products.create!({
                           name: "Flipflops",
                           description: "The inferior type of flip flop, pair with socks to complete the look",
                           stockCount: 19,
                           pricePence: 1900,
                           image: openAsset("Clothes3.png")
                       })

sect2.products.create!({
                           name: "Carrot",
                           description: "Orange thing that came out the ground",
                           stockCount: 2000,
                           pricePence: 80,
                           image: openAsset("Food1.png")
                       })
sect2.products.create!({
                           name: "Bread",
                           description: "This doesn't look right",
                           stockCount: 20,
                           pricePence: 100,
                           image: openAsset("Food2.png")
                       })
sect2.products.create!({
                           name: "Water",
                           description: "Container not included",
                           stockCount: 2000,
                           pricePence: 9726,
                           image: openAsset("Food3.png")
                       })

sect3.products.create!({
                           name: "Scooter",
                           description: "skoot skoot",
                           stockCount: 67,
                           pricePence: 7082,
                           image: openAsset("Trans1.png")
                       })
sect3.products.create!({
                           name: "Car",
                           description: "Must be over 17 to buy. Must be under 2 to think this is what a car looks like",
                           stockCount: 1,
                           pricePence: 6000064,
                           image: openAsset("Trans2.png")
                       })
sect3.products.create!({
                           name: "Skateboard",
                           description: "1: No this is not a good idea. 2: No you are not as good as you think you are.
                                         3: Yes this is as dangerous as people say it is",
                           stockCount: 56,
                           pricePence: 9375,
                           image: openAsset("Trans3.png")
                       })

User.destroy_all
# All users have password set to be blank
User.create!({
                 firstName: "Test",
                 lastName: "User1",
                 email: "Test1@testacc.com",
                 password_digest: "$2a$10$TftiUIoIGjrFw2Xaled0fuwxisIZ375XwJ.PbkF3.gVrVn7kdWBTa",
                 created_at: "2020-11-06 16:21:44.231242",
                 updated_at: "2020-11-06 16:21:44.231242"
             })
User.create!({
                 firstName: "Test",
                 lastName: "User2",
                 email: "Test2@testacc.com",
                 password_digest: "$2a$10$TftiUIoIGjrFw2Xaled0fuwxisIZ375XwJ.PbkF3.gVrVn7kdWBTa",
                 created_at: "2020-11-06 16:21:44.231242",
                 updated_at: "2020-11-06 16:21:44.231242"
             })
User.create!({
                 firstName: "Admin",
                 lastName: "User",
                 email: "admin@testacc.com",
                 admin: true,
                 password_digest: "$2a$10$TftiUIoIGjrFw2Xaled0fuwxisIZ375XwJ.PbkF3.gVrVn7kdWBTa",
                 created_at: "2020-11-14 12:21:44.231242",
                 updated_at: "2020-11-14 12:21:44.231242"
             })

Review.destroy_all
Review.create!({
                   product_id: 1,
                   user_id: 1,
                   content: "Fits perfectly",
                   rating: 5
               })
Review.create!({
                   product_id: 1,
                   user_id: 2,
                   content: "Heart was miss-shapen",
                   rating: 1
               })

Review.create!({
                   product_id: 6,
                   user_id: 1,
                   content: "Too wet",
                   rating: 0
               })
Review.create!({
                   product_id: 6,
                   user_id: 2,
                   content: "Shipped surprisingly well in an envelope",
                   rating: 5
               })