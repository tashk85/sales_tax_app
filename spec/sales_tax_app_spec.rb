require 'sales_tax_app'

RSpec.describe SalesTaxApp do
  let(:input_1) { SalesTaxApp.new("data/input_1.csv").to_s }
  
  let(:output_2) do
    CSV.parse("1, book, 12.49\n1, music CD, 16.49\n1, chocolate bar, 0.85\n\nSales Taxes: 1.50\nTotal: 29.83")
  end

  it 'receives csv input and returns a receipt with tax details' do
    expect(input_1).to eq(output_2)
  end
end
