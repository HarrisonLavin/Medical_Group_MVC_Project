class PatientController

  def create
      #Show the patient creation form, get input
      puts "What is the name of the Patient to add?"
      patient_name = gets.chomp
      pat= Patient.create(patient_name)
      #Shows success
      puts "Great, you've added #{patient_name}"
  end

  def update
    puts "Which Patient?"
    patient_name = gets.chomp.upcase
    patient= Patient.find_by_name(patient_name)

    # #Ask what the status for the patient is at this appointment
    puts "What is the Patient's status?"
    status = gets.chomp
    # patView= PatientView.new
    # status= patView.patient_status_form
    patient.add_to_chart(status)
  end

  def destroy
      puts "Which Patient?"
      patient_name = gets.chomp.upcase
      patient = Patient.find_by_name(patient_name)
      removed_pat = Patient.all.delete(patient)
      puts "#{removed_pat} has been dropped from the group."
  end
end