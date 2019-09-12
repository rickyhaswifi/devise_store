class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def clone
    @cart = @shop.clone
    @cart.save
  end
end
