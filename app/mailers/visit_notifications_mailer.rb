class VisitNotificationsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.visit_notifications_mailer.new_visit.subject
  #
  def new_visit
    doctor = params[:doctor]
    patient = params[:patient]
    visit = params[:visit]

    @message = "Hi, #{doctor.full_name}! A new visit created at #{visit.datetime}. Patient: #{patient.full_name}"

    mail to: doctor.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.visit_notifications_mailer.reminder.subject
  #
  def reminder
    doctor = params[:doctor]
    patient = params[:patient]
    visit = params[:visit]

    @message = "Hi, #{doctor.full_name}! Kind reminder about upcoming visit at #{visit.datetime}. Patient: #{patient.full_name}"

    mail to: doctor.email
  end
end
