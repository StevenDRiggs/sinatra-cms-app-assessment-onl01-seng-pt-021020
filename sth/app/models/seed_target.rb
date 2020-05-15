class SeedTarget < ActiveRecord::Base
  has_many :desire_seed_targets
  has_many :desires, through: :desire_seed_targets

  has_many :seed_sown_items
  has_many :seed_to_sow_items
end
