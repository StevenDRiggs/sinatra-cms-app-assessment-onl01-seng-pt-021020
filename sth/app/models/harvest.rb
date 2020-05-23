class Harvest < ActiveRecord::Base
  belongs_to :user

  has_many :bible_reference_harvests
  has_many :bible_references, through: :bible_reference_harvests

  has_many :harvest_sources
  has_many :sources, through: :harvest_sources


  def time_to_completion
    months = self.months_to_completion ? (self.months_to_completion > 0 ? "#{self.months_to_completion} months" : nil) : nil
    weeks = self.weeks_to_completion ? (self.weeks_to_completion > 0 ? "#{self.weeks_to_completion} weeks" : nil) : nil
    days = self.days_to_completion ? (self.days_to_completion > 0 ? "#{self.days_to_completion} days" : nil) : nil
    hours = self.hours_to_completion ? (self.hours_to_completion > 0 ? "#{self.hours_to_completion} hours" : nil) : nil
    minutes = self.minutes_to_completion ? (self.minutes_to_completion > 0 ? "#{self.minutes_to_completion} minutes" : nil) : nil

    time = [months, weeks, days, hours, minutes].compact

    time ? time.join(', ') : '0'
  end

  def time_to_completion=(timestring)
    total_minutes = timestring.match?(/\d+\s*minute/) ? timestring.match(/(\d+)\s*minute/)[1].to_i : 0
    total_minutes += timestring.match?(/\d+\s*hour/) ? timestring.match(/(\d+)\s*hour/)[1].to_i * 60 : 0
    total_minutes += timestring.match?(/\d+\s*day/) ? timestring.match(/(\d+)\s*day/)[1].to_i * 60 * 24 : 0
    total_minutes += timestring.match?(/\d+\s*week/) ? timestring.match(/(\d+)\s*week/)[1].to_i * 60 * 24 * 7 : 0
    total_minutes += timestring.match?(/\d+\s*month/) ? timestring.match(/(\d+)\s*month/)[1].to_i * 60 * 24 * 7 * 4 : 0

    self.months_to_completion = total_minutes / (60 * 24 * 7 * 4)
    total_minutes %= (60 * 24 * 7 * 4)

    self.weeks_to_completion = total_minutes / (60 * 24 * 7)
    total_minutes %= (60 * 24 * 7)

    self.days_to_completion = total_minutes / (60 * 24)
    total_minutes %= (60 * 24)

    self.hours_to_completion = total_minutes / 60
    total_minutes %= 60

    self.minutes_to_completion = total_minutes

    true
  end

  def total_time_received
    total_minutes = self.sources.collect {|source| source.minutes_received}.sum
    total_minutes += self.sources.collect {|source| source.hours_received}.sum * 60
    total_minutes += self.sources.collect {|source| source.days_received}.sum * 60 * 24
    total_minutes += self.sources.collect {|source| source.weeks_received}.sum * 60 * 24 * 7
    total_minutes += self.sources.collect {|source| source.months_received}.sum * 60 * 24 * 7 * 4

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

  def total_money_received
    self.sources.collect {|source| source.money_received}.sum
  end

  def all_received_items
    all_items = self.sources.collect {|source| source.received_items}.flatten
    unique_items = all_items.uniq
    return_items = {}

    for item in unique_items
      return_items[item] = all_items.count(item)
    end

    return_items
  end
    
   def first_three
     source_names = self.sources.collect {|source| source.name}

     source_names.length > 3 ? source_names[0..2] : source_names
   end

end
