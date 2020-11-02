class Event < ApplicationRecord
    belongs_to :admin, class_name: 'User'
    has_many :attendances
    has_many :participants, class_name: 'User', through: :attendances
    # validates :title, presence: true, length: { in: 5..140 }
    # validates :description, presence: true, length: { in: 20..1000 }
    # validates :price, presence: true, value: { in: 1..1000 }
    # validates :location, presence: true
    validate :is_started
    validates :duration, presence: true
    validate :is_multiple_of_5?

    def is_multiple_of_5?
      errors.add(:duration, "The duration should be a multiple of 5") if 
      duration.to_f % 5 != 0
    end

    def is_started
        errors.add(:start_date, "Ne peut-être dans le passé") if
        self.start_date < Time.now
    end
end