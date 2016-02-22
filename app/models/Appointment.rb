class Appointment
  extend Findable
  attr_accessor :status, :day, :doctor, :patient
  @@all = []
  def initialize(information)
    @status = "scheduled"
    # @time = time
    # @doctor = doctor
    # @patient = patient
    @day = information.fetch(:day)
    @doctor = information.fetch(:doctor)
    @patient = information.fetch(:patient)
    @@all << self
  end

  # def self.all
  #   @@all
  # end

  def find_appoint(day, doctor, patient)
    find_by_field(day, day) &
    find_by_field(doctor, doctor) &
    find_by_field(patient, patient)
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS appointments (
        id INTEGER PRIMARY KEY,
        day TEXT,
        doctor TEXT,
        patient TEXT
      )
      SQL
    DB[:conn].execute(sql)
  end

  def save
    sql = <<-SQL
      INSERT INTO appointments (day, doctor, patient)
      VALUES (?, ?, ?)
      SQL
    DB[:conn].execute(sql, self.day, self.doctor, self.patient)
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

end
