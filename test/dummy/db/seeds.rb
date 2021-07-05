# Reset database
User.destroy_all
Product.destroy_all
Order.destroy_all

# Seed database
Rake::Task["db:seed:users"].invoke
Rake::Task["db:seed:products"].invoke
Rake::Task["db:seed:orders"].invoke
