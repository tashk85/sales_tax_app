class Receipt
  def initialize
    @receipt = []
    @csv = []
  end

  def add_item(line_item)
    @receipt << "#{line_item['Quantity']},#{line_item['Product']},#{line_item['Price']}"
  end

  def print(sales_tax, total)
    puts @receipt.join("\n")
    puts "\n"
    puts "Sales Taxes: #{format_total(sales_tax)}"
    puts "Total: #{format_total(total)}"
  end

  def format_total(num)
    sprintf("%.2f", num)
  end
end