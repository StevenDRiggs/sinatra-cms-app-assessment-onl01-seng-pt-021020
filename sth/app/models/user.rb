class User < ActiveRecord::Base
  has_secure_password

  has_many :bible_reference_desires
  has_many :bible_reference_harvests
  has_many :bible_reference_seeds
  has_many :bible_references
  has_many :desires
  has_many :harvest_sources
  has_many :harvests
  has_many :received_items
  has_many :seed_targets
  has_many :seeds
  has_many :sources
  has_many :sown_items
  has_many :targets
  has_many :to_sow_items


  def logged_in=(bool)
    super(bool)

    self.save

    # if bool
      # insert threaded logout timer here
    # end
  end
end
