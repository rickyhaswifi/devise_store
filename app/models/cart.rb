class Cart < ApplicationRecord
  belongs_to :user

  def cartsum
    cartsum = Cart.sum(:price);
  end
  
end
