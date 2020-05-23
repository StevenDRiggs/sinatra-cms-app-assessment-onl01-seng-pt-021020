class SeedTarget < ActiveRecord::Base
  belongs_to :user

  belongs_to :seed
  belongs_to :target
end
