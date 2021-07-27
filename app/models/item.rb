class Item < ApplicationRecord
  # Validations
  validates_presence_of :code, :amount, :description
  validates_uniqueness_of :code

  # Enums
  enum status: [:active, :deleted]

  def amount_formatted
    Money.new(self.amount, 'BRL').format
  end
end
