require 'sales_tax_app'

RSpec.describe SalesTaxApp do
  it 'Receives CSV input and returns values with tax details' do
    input_1 = SalesTaxApp.new("data/input_1.csv").process_receipt
    output_1 =  "1,book,12.49\n1,music CD,16.49\n1,chocolate bar,0.85\n\nSales Taxes: 1.50\nTotal: 29.83\n"

    expect(input_1).to eq(output_1)
  end

  it 'Receives CSV input and returns values with tax details' do
    input_2 = SalesTaxApp.new("data/input_2.csv").process_receipt
    output_2 = "1,imported box of chocolates,10.50\n1,imported bottle of perfume,54.65\nSales Taxes: 7.65\nTotal: 65.15\n"

    expect(input_2).to eq(output_2)
  end

  it 'Receives CSV input and returns values with tax details' do
    input_3 = SalesTaxApp.new("data/input_3.csv").process_receipt
    output_3 = "1,imported bottle of perfume,32.19\n1,bottle of perfume,20.89\n1,packet of headache pills,9.75\n1,box of imported chocolates,11.85\n\nSales Taxes: 6.70\nTotal: 74.68\n"

    expect(input_3).to eq(output_3)
  end
end
