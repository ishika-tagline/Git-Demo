class Fish < ApplicationRecord
    belongs_to :tank, optional: true
end
