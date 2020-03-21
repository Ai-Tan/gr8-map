class Map < ApplicationRecord
  has_many_attached :images
  self.inheritance_column = :_type_disabled
  
end
