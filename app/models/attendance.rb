class Attendance < ApplicationRecord
    belongs_to :event
    belongs_to :participant, class_name: 'User'

    after_create :new_participant_send

    def new_participant_send
      AttendanceMailer.new_participant_mail(self).deliver_now
    end
end
