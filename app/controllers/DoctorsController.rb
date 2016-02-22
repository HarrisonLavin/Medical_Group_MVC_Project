class DoctorController


  def create
    puts "What is the name of the Doctor to add?"
    doctor_name = gets.chomp
    Doctor.create(doctor_name)
  end

  def destory
    puts "Which Doctor?"
    doctor_name = gets.chomp.upcase
    doctor = Doctor.find_by(doctor_name)
    removed_doc = Doctor.all.delete(doctor)
    puts "#{removed_doc} has been fired."
  end
end