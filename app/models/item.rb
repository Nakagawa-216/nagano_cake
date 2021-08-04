class Item < ApplicationRecord
  attachment :image
  # enum is_active: { on_sale: true, stop_sale: false }
  belongs_to :genre
end
