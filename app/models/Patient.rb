class Patient

extend Findable
  attr_reader :name, :chart, :id
  @@all = []

  def initialize(name, id=nil)
    @id = id
    @name = name
    @chart = []
    # @@all << self
  end

  def self.new_from_db(row)
    new_patient = self.new(row[1])
    new_patient
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS patients (
        id INTEGER PRIMARY KEY,
        name TEXT
      )
      SQL
    DB[:conn].execute(sql)
  end

  def save
    sql = <<-SQL
      INSERT INTO patients (name)
      VALUES (?)
      SQL
    DB[:conn].execute(sql, self.name)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM patients")[0][0]
  end

  def self.all
    sql = <<-SQL
      SELECT *
      FROM patients
    SQL
    DB[:conn].execute(sql).map do |row|
      self.new_from_db(row)
    end
  end

  def self.find_by_name(name)
    sql = <<-SQL
      SELECT *
      FROM patients
      WHERE name = ?
      LIMIT 1
    SQL

    DB[:conn].execute(sql, name).map do |row|
      self.new_from_db(row)
    end.first
  end

  def add_to_chart(status)
    @chart << status
  end

  # def appointments
  #   Appointments.all.find_all do |appt|
  #     appt.patient == self
  #   end
  # end

  # def doctors
  #   appointments.map {|appt| appt.doctor}
  # end

  def self.find_or_create_by(name)
    result = DB[:conn].execute("SELECT * FROM patients WHERE name = ?")
    if !result.empty?
      result_data = result[0]
      pati = Patient.new(result_data[1])
      pati.id = DB[:conn].execute("SELECT last_insert_rowid() FROM patients")[0][0]
    else
      patient = Patient.create(name)
      # binding.pry
    end
    patient
    # binding.pry
  end

  def self.create(name)
    patient = self.new(name)
    patient.save
  end

end
