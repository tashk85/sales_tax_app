task :default => [:run]

desc "load the input and return a sales tax receipt"
task "run" do
  $LOAD_PATH.unshift(File.dirname(__FILE__), "lib")
  require 'sales_tax_app'
  
  # load the data files into strings for you
  input1 = SalesTaxApp.new("data/input_3.csv")
  input1.process_receipt
  
end
