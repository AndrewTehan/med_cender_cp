ear
l# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


medical_center_a = MedicalCenter.create(email: "mca@gmail.com", address: "Minsk", schedule: "full time", legal_entity: "OOO MCA")

dentistry_deparment = Department.create(name: "Dentistry", description: "Dental treatment", medical_center_id: medical_center_a.id)
maternity_deparment = Department.create(name: "Maternity", description: "Birth attendance", medical_center_id: medical_center_a.id)

doctor_a = Doctor.create(phone_number: "+375447756860", email: "doca@gmail.com", department_id: dentistry_deparment.id, full_name: "Ivanov Ivan Ivanovich")
doctor_b = Doctor.create(phone_number: "+375448867971", email: "docb@gmail.com", department_id: dentistry_deparment.id, full_name: "Petrov Petr Petrovich")
doctor_c = Doctor.create(phone_number: "+375449978082", email: "docc@gmail.com", department_id: maternity_deparment.id, full_name: "Antonov Anton Antonovich")
doctor_d = Doctor.create(phone_number: "+375440089193", email: "docd@gmail.com", department_id: maternity_deparment.id, full_name: "Romanov Roman IRomanovich")

patient_a = Patient.create(phone_number: "+375441939880", email: "pata@gmail.com", passport_number: "patapassnum441939880", full_name: "Andreev Andrey Andreevich")
patient_b = Patient.create(phone_number: "+375442040911", email: "patb@gmail.com", passport_number: "patbpassnum442040911", full_name: "Sergeev Sergey Sergeevich")
patient_c = Patient.create(phone_number: "+375443151022", email: "patc@gmail.com", passport_number: "patcpassnum443151022", full_name: "Timopheev Timophey Timopheevich")
patient_d = Patient.create(phone_number: "+375444262133", email: "patd@gmail.com", passport_number: "patdpassnum444262133", full_name: "Denisov Denis Denisovich")
patient_e = Patient.create(phone_number: "+375445373244", email: "pate@gmail.com", passport_number: "patepassnum445373244", full_name: "Dmitriev Dmitriy Dmitrievich")
patient_f = Patient.create(phone_number: "+375446484355", email: "patf@gmail.com", passport_number: "patfpassnum446484355", full_name: "Kirilov Kirill Kirillovich")
patient_g = Patient.create(phone_number: "+375447595466", email: "patg@gmail.com", passport_number: "patgpassnum447595466", full_name: "Nikolaev Nikolay Nikolaevich")
patient_h = Patient.create(phone_number: "+375448606577", email: "path@gmail.com", passport_number: "pathpassnum448606577", full_name: "Vicktorov Vicktor Vicktorovich")

visit_a = Visit.create(datetime: DateTime.now, doctor_id: doctor_a.id, patient_id: patient_a.id)
visit_b = Visit.create(datetime: DateTime.now, doctor_id: doctor_a.id, patient_id: patient_b.id)
visit_c = Visit.create(datetime: DateTime.now, doctor_id: doctor_b.id, patient_id: patient_c.id)
visit_d = Visit.create(datetime: DateTime.now, doctor_id: doctor_b.id, patient_id: patient_d.id)
visit_e = Visit.create(datetime: DateTime.now, doctor_id: doctor_c.id, patient_id: patient_e.id)
visit_f = Visit.create(datetime: DateTime.now, doctor_id: doctor_c.id, patient_id: patient_f.id)
visit_g = Visit.create(datetime: DateTime.now, doctor_id: doctor_d.id, patient_id: patient_g.id)
visit_h = Visit.create(datetime: DateTime.now, doctor_id: doctor_d.id, patient_id: patient_h.id)
# medical_appointment - медицинское назначение
# medical_report - медицинское заключение
inspection_report_a = InspectionReport.create(medical_report: "some report", medical_appointment: "some appointment", visit_id: visit_a.id, patient_id: patient_a.id)
inspection_report_b = InspectionReport.create(medical_report: "some report", medical_appointment: "some appointment", visit_id: visit_b.id, patient_id: patient_b.id)
inspection_report_c = InspectionReport.create(medical_report: "some report", medical_appointment: "some appointment", visit_id: visit_c.id, patient_id: patient_c.id)
inspection_report_d = InspectionReport.create(medical_report: "some report", medical_appointment: "some appointment", visit_id: visit_d.id, patient_id: patient_d.id)
inspection_report_e = InspectionReport.create(medical_report: "some report", medical_appointment: "some appointment", visit_id: visit_e.id, patient_id: patient_e.id)
inspection_report_f = InspectionReport.create(medical_report: "some report", medical_appointment: "some appointment", visit_id: visit_f.id, patient_id: patient_f.id)
inspection_report_g = InspectionReport.create(medical_report: "some report", medical_appointment: "some appointment", visit_id: visit_g.id, patient_id: patient_g.id)
inspection_report_h = InspectionReport.create(medical_report: "some report", medical_appointment: "some appointment", visit_id: visit_h.id, patient_id: patient_h.id)