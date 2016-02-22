class PatientController

  def self.create
      #Show the patient creation form, get input
      puts "What is the name of the Patient to add?"
      patient_name = gets.chomp

      Patient.new(patient_name)
  end

  def self.update
    # #Ask which patient to update
    # puts "Which Patient?"
    # patient_name = gets.chomp.upcase
    patView= PatientView.new
    patient_name= patView.patient_update_form
    patient= Patient.find_by_field(patient_name, name)

    # #Ask what the status for the patient is at this appointment
    # puts "What is the Patient's status?"
    # status = gets.chomp
    patView= PaitentView.new
    status= patView.patient_status_form
    patient.add_to_chart(status)
  end

  def self.destroy
      puts "Which Patient?"
      patient_name = gets.chomp.upcase      
      patient = Patient.find_by_field(patient_name, name)
      removed_pat = Patient.all.delete(patient)
      puts "#{removed_pat} has been dropped from the group."
  end
end