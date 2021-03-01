require 'csv'

task :default => [:run]

desc "load the prices, order, payments, and execute it all!"
task "run" do
  $LOAD_PATH.unshift(File.dirname(__FILE__), "lib")
  require 'sales_tax_app'
  
  # load the data files into strings for you
  input1 = SalesTaxApp.new("data/input_1.csv")
  puts input1.inspect
  
end
