user_ids = User.pluck(:id)
product_ids = Product.pluck(:id)

300.times do
  user = User.find(user_ids.sample)
  order = FactoryBot.create(:order, user: user)
  nb_items = rand(5..10)

  nb_items.times do
    product = Product.find(product_ids.sample)
    FactoryBot.create(:line_item, order: order, product: product, price: product.price)
  end

  order.recalculate_price! and order.checkout! if rand(100) < 90
end
