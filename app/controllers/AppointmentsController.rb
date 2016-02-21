class AppointmentController


  def self.create
    puts "What date?"
    date = gets.chomp
    puts "With which Doctor?"
    doctor = gets.chomp
    puts "For which Patient?"
    patient = gets.chomp
    Appointment.new(date: date, doctor: doctor_name, patient: patient_name)
  end


  def self.update
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
  end

  def self.destroy
    puts "What date?"
    date = gets.chomp
    puts "With which Doctor?"
    doctor = gets.chomp
    puts "For which Patient?"
    patient = gets.chomp
    appointment = Appointment.find_appoint(date, doctor, patient)
    removed_appt= Appointment.all.delete(appointment)
    puts "#{removed_appt.patient.name}'s appointment with #{removed_appt.doctor.name} on date #{removed_appt.date} has been cancelled."
  end

end