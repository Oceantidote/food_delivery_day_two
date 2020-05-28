require_relative "../views/orders_view"
require_relative "../views/meals_view"
require_relative "../views/customers_view"
require_relative "../views/sessions_view"
require_relative "../models/order"

class OrdersController
  def initialize(order_repository)
    @order_repository = order_repository
    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @sessions_view = SessionsView.new
  end

  def add
    @meals_view.display(@order_repository.meal_repository.all)
    meal_id = @orders_view.ask_user_for("The index of the meal you'd like to add").to_i
    meal = @order_repository.meal_repository.find(meal_id)

    @customers_view.display(@order_repository.customer_repository.all)
    customer_id = @orders_view.ask_user_for("The index of the customer you'd like to add").to_i
    customer = @order_repository.customer_repository.find(customer_id)


    @sessions_view.display(@order_repository.employee_repository.all)
    employee_id = @sessions_view.ask_for("employee id")

    employee = @order_repository.employee_repository.find(employee_id.to_i)
    order = Order.new(customer: customer, meal: meal, employee: employee)
    @order_repository.add(order)
  end

  def list
    display_orders
  end

  def list_undelivered
    @orders_view.list_undelivered_orders(@order_repository.all)
  end

  private

  def display_orders
    orders = @order_repository.all
    @orders_view.display(orders)
  end
end
