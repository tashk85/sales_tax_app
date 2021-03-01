require 'csv'

class SalesTaxApp
  attr_accessor :input

  def initialize(csv)
    @input = read_csv(csv)
  end

  def to_s
    pp @input.inspect
  end

  def read_csv(csv)
    CSV.read(csv)
  end
end
