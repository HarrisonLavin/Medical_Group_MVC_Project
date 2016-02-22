class DoctorController


  def create
    puts "What is the name of the Doctor to add?"
    doctor_name = gets.chomp
    Doctor.create(doctor_name)
  end

  def destroy
    # binding.pry
    puts "Which Doctor?"
    doctor_name = gets.chomp.upcase
    doctor = Doctor.find_or_create_by(doctor_name)
    # binding.pry
    # removed_doc = Doctor.all.delete(doctor)
    # binding.pry
    destroy_doc(doctor)
    puts "#{doctor_name} has been fired."
  end

  def destroy_doc(doctor)
    sql = <<-SQL
      DELETE FROM doctors WHERE name = ?
      SQL
    binding.pry
    DB[:conn].execute(sql)
  end

end
