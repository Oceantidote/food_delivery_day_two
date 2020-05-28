class OrdersView
  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. #{order.meal.name} #{order.customer.name} : #{order.customer.address} : #{order.employee.username} "
    end
  end

  def list_undelivered_orders(orders)
    orders.each do |order|
      puts "#{order.meal.name} #{order.customer.name}"
    end
  end

  def ask_user_for(stuff)
    puts "#{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end
end
