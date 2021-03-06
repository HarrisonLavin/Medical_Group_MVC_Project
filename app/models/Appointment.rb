class Appointment
  extend Findable
  attr_accessor :status, :day, :doctor, :patient

  def initialize(information)
    @status = "scheduled"
    # @time = time
    # @doctor = doctor
    # @patient = patient
    @day = information.fetch(:day)
    @doctor = information.fetch(:doctor)
    @patient = information.fetch(:patient)
  end

  # def self.all
  #   @@all
  # end

  # def find_appoint(day, doctor, patient)
  #   find_by_field(day, day) &
  #   find_by_field(doctor, doctor) &
  #   find_by_field(patient, patient)
  # end


  def self.new_from_db(row)
    appt = self.new({day: row[1], doctor_id: Doctor.find_by_id(row[2]), patient_id: Patient.find_by_id(row[3])})
    appt 
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS appointments (
        id INTEGER PRIMARY KEY,
        day TEXT,
        doctor_id INTEGER,
        patient_id INTEGER
      )
      SQL
    DB[:conn].execute(sql)
  end

  def save
    sql = <<-SQL
      INSERT INTO appointments (day, doctor_id, patient_id)
      VALUES (?, ?, ?)
      SQL
    DB[:conn].execute(sql, self.day, self.doctor.id, self.patient.id)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM patients")[0][0]
  end

  def self.all
    # @@all
    sql = <<-SQL
      SELECT *
      FROM appointments
    SQL
    DB[:conn].execute(sql).map do |row|
      self.new_from_db(row)
    end
  end

  def self.find_by_name(name)
    sql = <<-SQL
      SELECT *
      FROM appointments
      WHERE name = ?
      LIMIT 1
    SQL
  end

  def self.find_appointment(appointment_id)
    sql = <<-SQL
      SELECT *
      FROM appointments
      WHERE appointment_id = ?
      LIMIT 1
    SQL
  end

end
