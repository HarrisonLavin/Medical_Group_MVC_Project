class DoctorController


  def self.create
    puts "What is the name of the Doctor to add?"
    doctor_name = gets.chomp
    Doctor.new(doctor_name)
  end

  def self.destory
    puts "Which Doctor?"
    doctor_name = gets.chomp.upcase
    doctor = Doctor.find_by_field(doctor_name, name)
    removed_doc = Doctor.all.delete(doctor)
    puts "#{removed_doc} has been fired."
  end
end