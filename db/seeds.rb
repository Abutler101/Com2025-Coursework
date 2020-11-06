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

                       })
sect1.products.create!({

                       })
sect1.products.create!({

                       })

sect2.products.create!({

                       })
sect2.products.create!({

                       })
sect2.products.create!({

                       })

sect3.products.create!({

                       })
sect3.products.create!({

                       })
sect3.products.create!({

                       })