SecuredSubscription.destroy_all
SecuredItem.destroy_all
Subscription.destroy_all
ItemDesign.destroy_all
User.destroy_all

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

