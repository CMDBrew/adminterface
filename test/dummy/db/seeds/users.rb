FactoryBot.create_list(:user, 100) do |user, _index|
  FactoryBot.create_list(:user_address, rand(1..3), user: user)
end
