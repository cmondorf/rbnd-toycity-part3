class Product
  @@products = []

  attr_accessor :title, :price, :stock

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
  @@products
  end

  def self.indexer(title_to_index)
    counter = 0
    while counter < @@products.count
      if title_to_index == @@products[counter].title
        return counter
      end
      counter +=1
    end
    return counter += 1
  end

  def product_new?
    if @@products.empty?
      return true
    else
      index = Product.indexer(@title)
      if index >= @@products.count
        return true
      else
        return false
      end
    end
  end

  def self.find_by_title(title_to_find)
    counter = 0
    while counter < @@products.count
      if title_to_find == @@products[counter].title
      #put everything into a hash
        found_prod_hash = @@products[counter]
        return found_prod_hash
      end
    counter += 1
    end
    raise ProductNotFoundError, "#{title_to_find} doesn't seem to exist in the catalog.
   Why don't you add it now?"
  end

  def in_stock?
    return @stock > 0
  end

  def self.in_stock
    products_in_stock = @@products.select { |product| product.in_stock? }
  end

  private

  def add_to_products
    if product_new? == true
      @@products << self
    else
      raise DuplicateProductError, "#{title} already exists!"
    end
  end




end
