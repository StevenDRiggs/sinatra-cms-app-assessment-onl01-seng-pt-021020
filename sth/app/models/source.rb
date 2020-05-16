class Source < ActiveRecord::Base
  has_many :harvest_sources
  has_many :harvests, through: :harvest_seeds

  has_many :received_items


  def string_to_time_unit(string, word, multiplier)
    m = string.match(/(\d+)\s*#{word}/)
    
    m ? m[1].to_i * multiplier : 0
  end

  def time_received
    months = self.months_received > 0 ? "#{self.months_received} months" : nil
    weeks = self.weeks_received > 0 ? "#{self.weeks_received} weeks" : nil
    days = self.days_received > 0 ? "#{self.days_received} days" : nil
    hours = self.hours_received > 0 ? "#{self.hours_received} hours" : nil
    minutes = self.minutes_received > 0 ? "#{self.minutes_received} minutes" : nil

    time = [months, weeks, days, hours, minutes].compact

    time ? time.join(', ') : '0'
  end

  def add_time_received(timestring)
    months = string_to_time_unit(timestring, 'month', 40_320)
    weeks = string_to_time_unit(timestring, 'week', 10_080)
    days = string_to_time_unit(timestring, 'day', 1440)
    hours = string_to_time_unit(timestring, 'hour', 60)
    minutes = string_to_time_unit(timestring, 'minute', 1)

    total_minutes = [months, weeks, days, hours, minutes].sum

    self.months_received = total_minutes / 40_320
    total_minutes %= 40_320

    self.weeks_received = total_minutes / 10_080
    total_minutes %= 10_080

    self.days_received = total_minutes / 1440
    total_minutes %= 1440

    self.hours_received = total_minutes / 60

    self.minutes_received = total_minutes % 60

    self.time_received
  end

  def time_received=(timestring)
    self.months_received = 0
    self.weeks_received = 0
    self.days_received = 0
    self.hours_received = 0
    self.minutes_received = 0

    add_time_received(timestring)
  end
    
end
