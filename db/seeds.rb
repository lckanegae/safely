# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

Money.locale_backend = nil

["Samsung S9", "Samsung S10", "Iphone 7", "Iphone 8", "Iphone 11", "Nexus 2", "Windows Phone"].each do |design|
  @item_design = ItemDesign.create!(
    name: design,
    refund: Money.new(rand(100..200), "USD").format,
    item_type: "Phone"
    )

  puts "Creating Item Design #{@item_design.name}"

  Subscription.create!(
    item_design: @item_design,
    subscription_type: "daily",
    days: rand(10..30),
    price: Money.new(rand(100..200), "USD").format
    )

  puts "Creating Subscription for #{@item_design.name}"
end

["Leticia", "Gilbas", "Tatchi", "Leon", "Carol", "Thierry", "Ana", "Roberto", "JoA"].each do |username|
  @user = User.create!(
    email: "#{username.downcase}@lewagon.com",
    password: "123456",
    first_name: username,
    last_name: "Lewagon",
    address: "Av. Paulista, 123",
    phone_number: "(+5511)123123123",
    birth_date: Date.new(2001,11,11),
    cpf: "423.423.423-#{rand(10-99)}",
    nickname: username

    )
  puts "Creating user #{@user.first_name} #{@user.last_name}"
end

40.times do

  @item_design = ItemDesign.all.sample()
  @user = User.all.sample()
  @subscription = Subscription.find_by item_design: @item_design

  SecuredItem.create!(
    user: @user,
    item_design: @item_design,
    subscription: @subscription
    )
  puts "Creating secured item #{@item_design.name} for #{@user.first_name} #{@user.last_name}"
end
