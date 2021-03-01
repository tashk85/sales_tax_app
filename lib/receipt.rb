class Receipt
  def initialize
    @receipt = []
  end

  def add_item(line_item)
    @receipt << line_item
  end

  def return_csv
    CSV.open("output.csv", "w") do |csv|
      csv << line_item
    end
  end
end