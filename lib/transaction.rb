class Transaction

attr_accessor :id, :customer, :product

@@transaction_id = 0

def initialize(customer, product)
  @@transaction_id += 1
  @id = @@transaction_id
  @customer = customer
  @product = product
end



end
