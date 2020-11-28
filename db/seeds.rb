$design_path = Rails.root.join('app','assets','images','item_designs')
Dir.children($design_path).each do |design_filename|
  design_path = $design_path + design_filename
  design = File.basename(design_path, File.extname(design_path))

  @item_design = ItemDesign.new(
    name: design,
    refund: Money.new(rand(100..200), "USD"),
    item_type: "Mobile"
    )
  @item_design.design.attach(io: File.open(design_path), filename: design)
  @item_design.save!

  puts "Creating Item #{@item_design.name}"

  ["Damage", "Loss", "Theft"].each do |type|
    Subscription.create!(
      item_design: ItemDesign.find_by(name: design),
      subscription_type: type,
      price: Money.new(rand(100..200), "USD")
      )
    puts "Creating #{type} Insurance for #{@item_design.name}"
  end
end

["Asus Zenbook 14", "MacBook Air", "Acer Aspire I5", "MacBook Pro", "Vaio FE14"].each do |design_filename|
  @item_design = ItemDesign.new(
    name: design_filename,
    refund: Money.new(rand(100..200), "USD"),
    item_type: "Mobile"
    )
  @item_design.save!

  puts "Creating Item #{@item_design.name}"

  ["Damage", "Loss", "Theft"].each do |type|
    Subscription.create!(
      item_design: ItemDesign.find_by(name: design_filename),
      subscription_type: type,
      price: Money.new(rand(100..200), "USD")
      )
    puts "Creating #{type} Insurance for #{@item_design.name}"
  end
end

["HRV", "Fox Sport", "Honda Fit", "HB20", "Golf", "HB20 Sedan", "Captiva", "Hilux"].each do |design_filename|
  @item_design = ItemDesign.new(
    name: design_filename,
    refund: Money.new(rand(100..200), "USD"),
    item_type: "Mobile"
    )
  @item_design.save!

  puts "Creating Item #{@item_design.name}"

  ["Damage", "Loss", "Theft"].each do |type|
    Subscription.create!(
      item_design: ItemDesign.find_by(name: design_filename),
      subscription_type: type,
      price: Money.new(rand(100..200), "USD")
      )
    puts "Creating #{type} Insurance for #{@item_design.name}"
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
