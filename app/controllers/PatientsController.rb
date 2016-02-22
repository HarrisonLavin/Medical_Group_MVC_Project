class PatientController


  def self.create
    puts "What is the name of the Patient to add?"
      patient_name = gets.chomp
      Patient.new(patient_name)
  end

  def self.update
    puts "Which Patient?"
    patient_name = gets.chomp.upcase
    patient= Patient.find_by_field(patient_name, name)
    puts "What is the Patient's status?"
    status = gets.chomp
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