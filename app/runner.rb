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
      puts "What time?"
      time = gets.chomp
      puts "With which Doctor?"
      doctor = gets.chomp
      puts "For which Patient?"
      patient = gets.chomp
      Appointment.new(time: time, doctor: doctor_name, patient: patient_name)
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
      "ERROR: Not a valid resource, try doctor, appointment, or patient"
    end
  when "review"
    puts "What resource would you like to review?"
    resource = gets.chomp
    case resource
    when "appointment"
      #DO THE THING, CREATE THE APPOINTMENT
    when "doctor"
      #Create THE DOC-TOOOOOOR
    when "patient"
      #Create the patient
    end
  when "update"
    puts "What resource would you like to update?"
    resource = gets.chomp
    case resource
    when "appointment"
      #DO THE THING, CREATE THE APPOINTMENT
    when "doctor"
      #Create THE DOC-TOOOOOOR
    when "patient"
      #Create the patient
    end
  when "destory" 
    puts "What resource would you like to destroy?"
    resource = gets.chomp
    case resource
    when "appointment"
      #DO THE THING, CREATE THE APPOINTMENT
    when "doctor"
      #Create THE DOC-TOOOOOOR
    when "patient"
      #Create the patient
    end
  else
    puts "ERROR: Valid actions are Create, Review, Update, Destory"
end
