# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create users
5.times do |no|
  no += 1
  User.create(
        :name => "name#{no}",
        :age => no,
        :address => no,
        :email => no,
        :password => no
      )
end
