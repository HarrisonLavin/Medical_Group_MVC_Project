action = "nothing"
resource = "nothing"

while action != "exit"
  puts "What action would you like to take?"
  action = gets.chomp
  case action
  when "create"
    puts "What resource would you like to create?"
    resource = gets.chomp
    case resource
    when "appointment"
      appointment= AppointmentController.new 
      appointment.create
    when "doctor"
      doc = DoctorController.new
      doc.create
    when "patient"
      #Create the patient
      patient = PatientController.new
      patient.create
    else
      "ERROR: Not a valid resource, try doctor, appointment, or patient"
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
    puts "What resource would you like to update?"
    resource = gets.chomp
    case resource
    when "appointment"
      appt = AppointmentController.new
      appt.update
    when "patient"
      #Create the patient
      pat = PatientController.new
      pat.update
    end
  when "destroy" 
    puts "What resource would you like to destroy?"
    resource = gets.chomp
    case resource
    when "appointment"
      appt = AppointmentController.new
      appt.destroy
    when "doctor"
      #Create THE DOC-TOOOOOOR
      doc = DoctorController.new
      doc.destroy
    when "patient"
      #Create the patient
      pat = PatientController.new
      pat.destroy
    end
  else
    puts "ERROR: Valid actions are Create, Review, Update, Destroy"
  end
end
