class Transaction

attr_accessor :id, :customer, :product, :price

@@transactions =[]

@@transaction_id = 0

def initialize(customer, product)
  if product.in_stock? == false
    raise ProductOutOfStockError, "#{product.title} seems to be out of stock. Sorry!"
  else
    @@transaction_id += 1
    @id = @@transaction_id
    @customer = customer
    @product = product
    stock_decrement
    @@transactions << self
  end
end



def self.all
  @@transactions
end

def self.find(trans_id)
  counter = 0
  while counter < @@transactions.count
    if trans_id == @@transactions[counter].id
    #put everything into a hash
      found_trans_hash = @@transactions[counter]
      return found_trans_hash
    end
  counter += 1
  end
  raise TransactionNotFoundError, "#{trans_id} doesn't seem to exist."
end

private

def stock_decrement
  @product.stock -= 1
end


end
