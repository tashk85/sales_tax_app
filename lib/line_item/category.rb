module LineItem
  class Category
    def contains?(item)
      descriptors.find { |t| item.include?(t) }
    end

    def sales_tax(price)
      0.1 * price
    end

    protected

    def descriptors
      []
    end
  end
end