class Order
  attr_accessor :delivered, :employee, :id
  attr_reader :customer, :meal

  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered] || false
  end
end
