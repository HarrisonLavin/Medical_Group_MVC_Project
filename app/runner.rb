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
      #Create THE DOC-TOOOOOOR
    when "patient"
      #Create the patient
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
