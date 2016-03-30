class Customer

  @@customers = []

attr_accessor :name

  def initialize(options={})
    @name = options[:name]
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.indexer(name_to_index)
    counter = 0
    while counter < @@customers.count
      if name_to_index == @@customers[counter].name
        return counter
      end
      counter +=1
    end
    return counter += 1
  end

  def customer_new?
    if @@customers.empty?
      return true
    else
      index = Customer.indexer(@name)
      if index >= @@customers.count
        return true
      else
        return false
      end
    end
  end

  def self.find_by_name(name_to_find)
    counter = 0
    while counter < @@customers.count
      if name_to_find == @@customers[counter].name
      #put everything into a hash
        found_cust_hash = @@customers[counter]
        return found_cust_hash
      end
    counter += 1
    end
    raise CustomerNotFoundError, "#{name_to_find} not found. Maybe add them now?"
  end


  def purchase(product)
    

  private


  def add_to_customers
    if customer_new? == true
      @@customers << self
    else
      raise DuplicateCustomerError, "#{name} already exists!"
    end
  end

end
