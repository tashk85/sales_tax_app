require 'csv'
require 'receipt'
require 'tax_calculator'

class SalesTaxApp
  SALES_TAXES = {} 
  attr_accessor :input, :receipt

  def initialize(csv_input)
    @input = read_csv(csv_input)
    @receipt = Receipt.new
    @sales_tax = 0
    @subtotal = 0
  end

  def process_receipt
    input.each do |line|
      line_item = line.to_h
      derive_sales_tax(line_item)
      derive_subtotal(line_item)
      receipt.add_item(line)
    end
    receipt.print(@sales_tax, derive_total)
  end

  protected

  def read_csv(csv)
    CSV.read(csv, headers: true)
  end

  def derive_sales_tax(line_item)
    tax = TaxCalculator.new(line_item).calculate_tax
    @sales_tax += tax
  end

  def derive_subtotal(line_item)
    @subtotal += line_item['Price'].to_f
  end

  def derive_total
    @subtotal + @sales_tax
  end
end
