SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :boats, 'Boats', '/boats' do |boats|
      boats.item :rent, 'Rent', '/boats/rent'
      boats.item :sell, 'Sell', '/boats/sell'
    end
    primary.item :houses, 'Houses', '/houses' do |houses|
      houses.item :rent, 'Rent', '/houses/rent'
      houses.item :sell, 'Sell', '/houses/sell'
    end
  end
end
