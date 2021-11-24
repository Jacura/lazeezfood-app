class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :store

  def total_price
    self.store.recipe_price * quantity
end
end
