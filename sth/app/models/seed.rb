class Seed < ActiveRecord::Base
  belongs_to :user

  has_many :bible_reference_seeds
  has_many :bible_references, through: :bible_reference_seeds

  has_many :seed_targets
  has_many :targets, through: :seed_targets


  def total_time_sown
    total_minutes = self.targets.collect {|target| target.minutes_sown}.sum
    total_minutes += self.targets.collect {|target| target.hours_sown}.sum * 60
    total_minutes += self.targets.collect {|target| target.days_sown}.sum * 60 * 24
    total_minutes += self.targets.collect {|target| target.weeks_sown}.sum * 60 * 24 * 7
    total_minutes += self.targets.collect {|target| target.months_sown}.sum * 60 * 24 * 7 * 4

    total_months = total_minutes /  (60 * 24 * 7 * 4)
    total_months = total_months > 0 ? "#{total_months} months" : nil
    total_minutes %= (60 * 24 * 7 * 4)

    total_weeks = total_minutes / (60 * 24 * 7)
    total_weeks = total_weeks > 0 ? "#{total_weeks} weeks" : nil
    total_minutes %= (60 * 24 * 7)

    total_days = total_minutes / (60 * 24)
    total_days = total_days > 0 ? "#{total_days} days" : nil
    total_minutes %= (60 * 24)

    total_hours = total_minutes / 60
    total_hours = total_hours > 0 ? "#{total_hours} hours" : nil
    total_minutes %= 60

    total_minutes = total_minutes > 0 ? "#{total_minutes} minutes" : nil

    total_time = [total_months, total_weeks, total_days, total_hours, total_minutes].compact

    total_time.length > 0 ? total_time.join(', ') : '0'
  end

  def total_time_to_sow
    total_minutes = self.targets.collect {|target| target.minutes_to_sow}.sum
    total_minutes += self.targets.collect {|target| target.hours_to_sow}.sum * 60
    total_minutes += self.targets.collect {|target| target.days_to_sow}.sum * 60 * 24
    total_minutes += self.targets.collect {|target| target.weeks_to_sow}.sum * 60 * 24 * 7
    total_minutes += self.targets.collect {|target| target.months_to_sow}.sum * 60 * 24 * 7 * 4

    total_months = total_minutes /  (60 * 24 * 7 * 4)
    total_months = total_months > 0 ? "#{total_months} months" : nil
    total_minutes %= (60 * 24 * 7 * 4)

    total_weeks = total_minutes / (60 * 24 * 7)
    total_weeks = total_weeks > 0 ? "#{total_weeks} weeks" : nil
    total_minutes %= (60 * 24 * 7)

    total_days = total_minutes / (60 * 24)
    total_days = total_days > 0 ? "#{total_days} days" : nil
    total_minutes %= (60 * 24)

    total_hours = total_minutes / 60
    total_hours = total_hours > 0 ? "#{total_hours} hours" : nil
    total_minutes %= 60

    total_minutes = total_minutes > 0 ? "#{total_minutes} minutes" : nil

    total_time = [total_months, total_weeks, total_days, total_hours, total_minutes].compact

    total_time.length > 0 ? total_time.join(', ') : '0'
  end

  def total_money_sown
    self.targets.collect {|target| target.money_sown}.sum
  end

  def total_money_to_sow
    self.targets.collect {|target| target.money_to_sow}.sum
  end

  def all_sown_items
    all_items = self.targets.collect {|target| target.sown_items}.flatten
    unique_items = all_items.uniq
    return_items = {}

    for item in unique_items
      return_items[item] = all_items.count(item)
    end

    return_items
  end

  def all_to_sow_items
    all_items = self.targets.collect {|target| target.to_sow_items}.flatten
    unique_items = all_items.uniq
    return_items = {}

    for item in unique_items
      return_items[item] = all_items.count(item)
    end

    return_items
  end

   def first_three
     target_names = self.targets.collect {|target| target.name}

     target_names.length > 3 ? target_names[0..2] : target_names
   end

end
