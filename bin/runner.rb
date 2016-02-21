action = "nothing"
resource = "nothing"

while action != "exit"
  puts "What action would you like to take?"
  action = gets.chomp
  case action
  when "create"
    while resource != "exit"
      puts "What resource would you like to create?"
      resource = gets.chomp
      case resource
      when "appointment"
        puts "What date?"
        date = gets.chomp
        puts "With which Doctor?"
        doctor = gets.chomp
        puts "For which Patient?"
        patient = gets.chomp
        Appointment.new(date: date, doctor: doctor_name, patient: patient_name)
      when "doctor"
        puts "What is the name of the Doctor to add?"
        doctor_name = gets.chomp
        Doctor.new(doctor_name)
      when "patient"
        #Create the patient
        puts "What is the name of the Patient to add?"
        patient_name = gets.chomp
        Patient.new(patient_name)
      else
        puts "ERROR: Not a valid resource, try doctor, appointment, or patient"
      end
    end
  when "review"
    while resource != "exit"
      puts "What resource would you like to review?"
      resource = gets.chomp
      case resource
      when "appointment"
        Appointment.all.each do |appt|
          puts "#{appt.patient.name} is scheduled to see #{appt.doctor.name} on date #{appt.date}"
        end
      when "doctor"
        Doctor.all.each {|doc| puts doc.name}
      when "patient"
        Patient.all.each {|pat| puts pat.name}
      else
        puts "ERROR: Not a valid resource, try doctor, appointment, or patient"
      end
    end
  when "update"
    while resource != "exit"
      puts "What resource would you like to update?"
      resource = gets.chomp
      case resource
      when "appointment"
        #DO THE THING, CREATE THE APPOINTMENT
        puts "Specify the appointment you would like to update:"
        puts "What date?"
        date = gets.chomp
        puts "With which Doctor?"
        doctor = gets.chomp
        puts "For which Patient?"
        patient = gets.chomp
        appt = Appointment.find_appoint(date, doctor, patient)
        puts "Check-In or reschedule?"
        choice = gets.chomp.upcase
        case choice
        when "CHECK-IN"
          #And then a miracle happens, wherein we select a given appt, and reschedule
          appt.status("Checked-in")
          puts "#{appt.patient.name} is #{appt.status} to see #{appt.doctor.name}."
        when "RESCHEDULE"
          puts "Reschedule to when?"
          appt.date = gets.chomp
          puts "The appointment has been rescheduled to #{appt.date}."
        end
      when "patient"
        #Create the patient
        puts "Which Patient?"
        patient_name = gets.chomp.upcase
        patient= Patient.find_by_field(patient_name, name)
        puts "What is the Patient's status?"
        status = gets.chomp
        patient.add_to_chart(status)
      else
        puts "ERROR: Not a valid resource, try appointment, or patient"
      end
    end
  when "destroy"
    while resource != "exit" 
      puts "What resource would you like to destroy?"
      resource = gets.chomp
      case resource
      when "appointment"
        puts "What date?"
        date = gets.chomp
        puts "With which Doctor?"
        doctor = gets.chomp
        puts "For which Patient?"
        patient = gets.chomp
        appointment = Appointment.find_appoint(date, doctor, patient)
        removed_appt= Appointment.all.delete(appointment)
        puts "#{removed_appt.patient.name}'s appointment with #{removed_appt.doctor.name} on date #{removed_appt.date} has been cancelled."
      when "doctor"
        #Create THE DOC-TOOOOOOR
        puts "Which Doctor?"
        doctor_name = gets.chomp.upcase
        doctor = Doctor.find_by_field(doctor_name, name)
        removed_doc = Doctor.all.delete(doctor)
        puts "#{removed_doc} has been fired."
      when "patient"
        #Create the patient
         puts "Which Patient?"
        patient_name = gets.chomp.upcase
        patient = Doctor.find_by_field(patient_name, name)
        removed_pat = Doctor.all.delete(patient)
        puts "#{removed_pat} has been dropped from the group."
      else
          puts "ERROR: Not a valid resource, try doctor, appointment, or patient"
      end
    end
  else
    puts "ERROR: Valid actions are Create, Review, Update, Destroy"
  end
end
