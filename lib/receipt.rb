class Receipt
  def initialize
    @receipt = []
  end

  def add_item(line_item)
    @receipt.push([line_item['Quantity'], line_item['Product'], line_item['Price']])
  end

  def print(sales_tax, total)
    # puts @receipt.map { |line| line.join(",") }.join("\n")
    # puts "\n"
    # puts "Sales Taxes: #{format_total(sales_tax)}"
    # puts "Total: #{format_total(total)}"
    
    generate_csv(sales_tax, total)
  end

  def generate_csv(sales_tax, total)
    new_csv = CSV.generate do |csv|
      @receipt.each do |r|
        csv << r
      end
      csv << []
      csv << ["Sales Taxes: #{format_total(sales_tax)}"]
      csv << ["Total: #{format_total(total)}"]
    end
    new_csv
  end

  def format_total(num)
    sprintf("%.2f", num)
  end
end