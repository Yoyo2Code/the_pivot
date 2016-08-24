class BookedDate < ApplicationRecord
  belongs_to :night
  belongs_to :property
end
