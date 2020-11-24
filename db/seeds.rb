# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

["Samsung S9", "Samsung S10", "Iphone 7", "Iphone 8", "Iphone 11", "Nexus 2", "Windows Phone"].each do |design|
  @item_design = ItemDesign.create!(
    name: design,
    refund: Money.new(rand(100..200), "USD"),
    item_type: "Phone"
    )

  puts "Creating Item Design #{@item_design.name}"

  ["Damage", "Loss", "Theft"].each do |type|
    Subscription.create!(
      item_design: @item_design,
      subscription_type: type,
      price: Money.new(rand(100..200), "USD")
      )
    puts "Creating Insurance for #{type} to #{@item_design.name}"
  end
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
    cpf: "423.423.4#{rand(10-99)}-#{rand(10-99)}",
    nickname: username
    )

  puts "Creating user #{@user.first_name} #{@user.last_name}"

  4.times do
    @item_design = ItemDesign.all.sample()

    secured_item = SecuredItem.create!(
      user: @user,
      item_design: @item_design
      )

    Subscription.where(item_design: @item_design).each do |subscription|
    SecuredSubscription.create!(
      secured_item: secured_item,
      subscription: subscription
      )
    end

    puts "Creating secured item #{@item_design.name} with subscriptions for #{@user.first_name} #{@user.last_name}"
  end
end
