class Harvest < ActiveRecord::Base
  has_many :bible_reference_harvests
  has_many :bible_references, through: :bible_reference_harvests

  has_many :harvest_sources
  has_many :sources, through: :harvest_sources


  def time_to_completion
    months = self.months_to_completion > 0 ? "#{self.months_to_completion} months" : nil
    weeks = self.weeks_to_completion > 0 ? "#{self.weeks_to_completion} weeks" : nil
    days = self.days_to_completion > 0 ? "#{self.days_to_completion} days" : nil
    hours = self.hours_to_completion > 0 ? "#{self.hours_to_completion} hours" : nil
    minutes = self.minutes_to_completion > 0 ? "#{self.minutes_to_completion} minutes" : nil

    time = [months, weeks, days, hours, minutes].compact

    time ? time.join(', ') : '0'
  end
    
end
