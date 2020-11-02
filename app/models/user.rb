class User < ApplicationRecord
    has_many :attendances
    has_many :participant_events, foreign_key: 'participant_id', class_name: "Event"
    
    after_create :welcome_send

    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end
end
