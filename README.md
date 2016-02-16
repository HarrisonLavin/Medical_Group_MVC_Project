# Medical_Group_MVC_Project

Harrison Laivn
Harrison.Lavin@gmail.com

Holly Peck
holly.m.peck@gmail.com

Doctor:
  Has name
  Has age
  Has Specialties
  Has_Many Appointments
  Has_many patients through appointments

Appointments (LINCHPIN)
  Has Status
  Has Time
  Belongs to both Doctors and Patients

Patients
  Has Name
  Has Age
  Has Chart
  Has_Many Appointments
  Has_Many Doctors through appointments

Actions:
  Create Appointment
  Reschedule Appointment
  Check-In Appointment
  Cancel Appointment
  Hire Doctor
  Fire Doctor
  Update Doc Certifications
  Join Patient
  Leave Patient
  update Chart
  display Patients for given Doctor
  display Doctors for Given patients
  Display all appts for Date
  Display all appts for Doc
  Display all appts for Patient