class Target < ActiveRecord::Base
  has_many :seed_targets
  has_many :seeds, through: :seed_targets

  has_many :sown_items
  has_many :to_sow_items


  def string_to_time_unit(string, word, multiplier)
    m = string.match(/(\d+)\s*#{word}/)
    
    m ? m[1].to_i * multiplier : 0
  end

  def time_sown
    "#{self.months_sown} months, #{self.weeks_sown} weeks, #{self.days_sown} days, #{self.hours_sown} hours, #{self.minutes_sown} minutes"
  end

  def time_to_sow
    "#{self.months_to_sow} months, #{self.weeks_to_sow} weeks, #{self.days_to_sow} days, #{self.hours_to_sow} hours, #{self.minutes_to_sow} minutes"
  end

  def add_time_sown(timestring)
    months = string_to_time_unit(string, 'month', 40_320)
    weeks = string_to_time_unit(string, 'week', 10_080)
    days = string_to_time_unit(string, 'day', 1440)
    hours = string_to_time_unit(string, 'hour', 60)
    minutes = string_to_time_unit(string, 'minute', 1)

    total_minutes = [months, weeks, days, hours, minutes].sum

    self.months_sown = total_minutes / 40_320
    total_minutes %= 40_320

    self.weeks_sown = total_minutes / 10_080
    total_minutes %= 10_080

    self.days_sown = total_minutes / 1440
    total_minutes %= 1440

    self.hours_sown = total_minutes / 60

    self.minutes_sown = total_minutes % 60

    self.time_sown
  end

  def time_sown=(timestring)
    self.months_sown = 0
    self.weeks_sown = 0
    self.days_sown = 0
    self.hours_sown = 0
    self.minutes_sown = 0

    add_time_sown(timestring)
  end
    
  def add_time_to_sow(timestring)
    months = string_to_time_unit(string, 'month', 40_320)
    weeks = string_to_time_unit(string, 'week', 10_080)
    days = string_to_time_unit(string, 'day', 1440)
    hours = string_to_time_unit(string, 'hour', 60)
    minutes = string_to_time_unit(string, 'minute', 1)

    total_minutes = [months, weeks, days, hours, minutes].sum

    self.months_to_sow = total_minutes / 40_320
    total_minutes %= 40_320

    self.weeks_to_sow = total_minutes / 10_080
    total_minutes %= 10_080

    self.days_to_sow = total_minutes / 1440
    total_minutes %= 1440

    self.hours_to_sow = total_minutes / 60

    self.minutes_to_sow = total_minutes % 60

    self.time_to_sow
  end

  def time_to_sow=(timestring)
    self.months_to_sow = 0
    self.weeks_to_sow = 0
    self.days_to_sow = 0
    self.hours_to_sow = 0
    self.minutes_to_sow = 0

    add_time_to_sow(timestring)
  end
    
end
