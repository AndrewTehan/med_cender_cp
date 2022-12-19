class ReportNotificationsMailer < ApplicationMailer
  include Rails.application.routes.url_helpers

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.report_notifications_mailer.report_created.subject
  #
  def report_created
    doctor = params[:doctor]
    patient = params[:patient]
    visit = params[:visit]
    @report_path = params[:report_path]

    @message = "Hi, #{patient.full_name}! Dr.#{doctor.full_name} submitted new medical report upon your recent visit at #{visit.datetime}"

    mail to: patient.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.report_notifications_mailer.report_updated.subject
  #
  def report_updated
    doctor = params[:doctor]
    patient = params[:patient]
    visit = params[:visit]
    @report_path = params[:report_path]

    @message = "Hi, #{patient.full_name}! Dr.#{doctor.full_name} updated medical report upon your recent visit at #{visit.datetime}"

    mail to: patient.email
  end
end
