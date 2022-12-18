module VisitNotifications
  class ReminderJob < ApplicationJob
    class NilError < StandardError
      MESSAGE = "Can't be nil"

      def message
        MESSAGE
      end
    end

    class NilDoctorError < NilError
      MESSAGE = "Doctor can't be nil"
    end

    class NilPatientError < NilError
      MESSAGE = "Patient can't be nil"
    end

    class NilVisitError < NilError
      MESSAGE = "Visit can't be nil"
    end

    def perform(visit_id)
      visit = Visit.find_by(id: visit_id)

      raise NilVisitError unless visit

      doctor = visit.doctor
      raise NilDoctorError unless doctor

      patient = visit.patient
      raise NilPatientError unless patient

      VisitNotificationsMailer.with(doctor: doctor, patient: patient, visit: visit).reminder.deliver_later
    end
  end
end
