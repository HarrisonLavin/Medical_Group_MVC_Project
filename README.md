# Medical_Group_MVC_Project

Harrison Laivn
Harrison.Lavin@gmail.com

Holly Peck
holly.m.peck@gmail.com

Jacob Levitin
jlevitin92@gmail.com

# Runner 
Doctor:
  Has name
  Has age
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
  Create Stuff:
    Create Appointment
    Hire Doctor
    Add Patient
  Review Stuff:
    Display Patients for given Doctor
    Display Doctors for Given patients
    Display all appts for Date
    Display all appts for Doc
    Display all appts for Patient
    Display Chart for Patient
  Update Stuff:
    Reschedule Appointment
    Check-In Appointment
    Update Patient Chart
  Destroy Stuff:
    Cancel Appointment
    Fire Doctor
    Drop Patient

    

