require 'line_item/category'
require 'line_item/book'
require 'line_item/food'
require 'line_item/imported'
require 'line_item/medicine'

class TaxCalculator
  attr_accessor :price, :product

  def initialize(line_item)
    @product = line_item['Product']
    @price = line_item['Price'].to_f
  end

  def calculate_tax
    if non_taxable_items? && imported?
      rounded_tax(price * 0.05)
    elsif imported?
      rounded_tax(price * 0.15)
    elsif non_taxable_items?
      0
    else
      rounded_tax(price * 0.1)
    end
  end

  protected

  def rounded_tax(tax)
    (tax * 20).ceil / 20.0
  end

  def non_taxable_items?
    is_book? || is_food? || is_medicine?
  end

  def is_book?
    LineItem::Book.new.contains?(product) != nil
  end

  def is_food?
    LineItem::Food.new.contains?(product) != nil
  end

  def is_medicine?
    LineItem::Medicine.new.contains?(product) != nil
  end

  def imported?
    LineItem::Imported.new.contains?(product) != nil
  end

  def other_category?
    LineItem::Category.new.contains?(product) == nil
  end
end