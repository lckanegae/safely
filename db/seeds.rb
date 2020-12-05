#Phone Seeds
$design_path = Rails.root.join('app','assets','images','item_designs','phones')
Dir.children($design_path).each do |design_filename|
  design_path = $design_path + design_filename
  design = File.basename(design_path, File.extname(design_path))

  @item_design = ItemDesign.new(
    name: design,
    refund: Money.new(rand(100..200), "USD"),
    item_type: "Phone"
    )
  @item_design.design.attach(io: File.open(design_path), filename: design)
  @item_design.save!

  puts "Creating Item #{@item_design.name}"

  ["Broken Screen Glass", "Damaged LCD", "Water Damage", "Loss", "Theft"].each do |type|
    Subscription.create!(
      item_design: ItemDesign.find_by(name: design),
      subscription_type: type,
      price: Money.new(rand(100..200), "USD")
      )
    puts "Creating #{type} Insurance for #{@item_design.name}"
  end
end

#Notebook Seeds
$design_path = Rails.root.join('app','assets','images','item_designs','notebooks')
Dir.children($design_path).each do |design_filename|
  design_path = $design_path + design_filename
  design = File.basename(design_path, File.extname(design_path))

  @item_design = ItemDesign.new(
    name: design,
    refund: Money.new(rand(100..200), "USD"),
    item_type: "Notebook"
    )
  @item_design.design.attach(io: File.open(design_path), filename: design)
  @item_design.save!

  puts "Creating Item #{@item_design.name}"

  ["Impact Damage", "Loss", "Theft"].each do |type|
    Subscription.create!(
      item_design: ItemDesign.find_by(name: design),
      subscription_type: type,
      price: Money.new(rand(100..200), "USD")
      )
    puts "Creating #{type} Insurance for #{@item_design.name}"
  end
end

#Car Seeds
$design_path = Rails.root.join('app','assets','images','item_designs','cars')
Dir.children($design_path).each do |design_filename|
  design_path = $design_path + design_filename
  design = File.basename(design_path, File.extname(design_path))

  @item_design = ItemDesign.new(
    name: design,
    refund: Money.new(rand(100..200), "USD"),
    item_type: "Car"
    )
  @item_design.design.attach(io: File.open(design_path), filename: design)
  @item_design.save!

  puts "Creating Item #{@item_design.name}"

  ["Liability", "Comp & Collision", "Uninsured Motorist", "Rental & Towing"].each do |type|
    Subscription.create!(
      item_design: ItemDesign.find_by(name: design),
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

    secured_item = SecuredItem.new(
      user: @user,
      item_design: @item_design,
      use_date: rand(0..1)
      )
    if secured_item.use_date == 1
      secured_item.activation_date = DateTime.now
      secured_item.deactivation_date = DateTime.now + rand(2..5).days
    end
    secured_item.save!

    Subscription.where(item_design: @item_design).each do |subscription|
    SecuredSubscription.create!(
      secured_item: secured_item,
      subscription: subscription
      )
    end

    puts "Creating secured item #{@item_design.name} with subscriptions for #{@user.first_name} #{@user.last_name}"
  end
end
