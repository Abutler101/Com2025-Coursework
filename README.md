# README
A ruby on rails web store for COM2025 coursework. 
What follows is general house keeping stuff, read on for notes
on: config, setup, testing, design, funky behaviour etc.

## Configuration
  * ###Dev Env
    * Built in ruby mine 2020.2 on ubuntu 20.04
    * Using Ruby version 2.5.7-p206
    * With Rails version 5.2.4.4
    * Using sqlite as the databse (The heroku branch runs postgres but has been put on hold for now)
    * Repo mirrored on gitlab and github. Both repo's will be set to public view once submission date has passed
       * gitlab: https://gitlab.eps.surrey.ac.uk/ab02259/com2025-coursework
       * github: https://github.com/Abutler101/Com2025-Coursework
    * Tested to be working in chrome Version 86.0.4240.198
    * Validation of functionality on lab machines is expected to take place later today
    * Image magick version 6.9.10-23 Q16 installed to fulfil dependency of gem 

## Setup
   ###Will fill this in when setting up on verification test
   
## Testing
To run all tests:

    rake test  

Expected output:
    
    Finished in 29.029574s, 3.7548 runs/s, 8.4052 assertions/s.
    109 runs, 244 assertions, 0 failures, 0 errors, 0 skips

## Design
  The problem was defined as an ecommerce site, this gave way to the identification of the following objects:
  * Users - store personal info relating to a human owner of a unique email address
  * Products - store info relating to a product, of which there is some amount in stock
  * Orders - Associate groups of order entries to users
  * Order entries - store how many of a given item were sold in a given order
  * Reviews - store a review and rating of a product by a user
  * Product Sections - associate groups of products to shared property
  * Shopping carts - temporarily store products of interest for a given user
  
  For each of these objects, properties and relationships were identified with the objective of producing a normalised database.
  In addition to the model objects, sessions were introduced to track logins. The decision was made to store carts as cookies 
  instead of in the DB or as a session var, to avoid the time out issues of sessions variables and reduce the database size.
  While not ideal, as this is only a simple implementation of a shopping cart, cookies were the best fit. If, features such
  as email prompts along the lines of: "You left something in your cart, come back and purchase here's a discount" etc were
  planned then the cart system would be moved over to Database storage with a similar table layout to the current order, order entry
  pair of tables.
## Funky Behaviour
  * The dropdown for sections seems to work intermittently- 
  the suspected cause is something to do with the page loading
  in a weird order. Reloading or using the navbar to move to another
  page seems to fix the issue of the non-responsive dropdown