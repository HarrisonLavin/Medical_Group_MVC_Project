class Doctor
extend Findable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.find_by_id(id)
    sql = <<-SQL
      SELECT * FROM doctors where id = doctor.id
    SQL
    row= DB[:conn].execute(sql)
    doc = Doctor.new_from_db(row)
    @id = id
    binding.pry
    doc
  end

  def self.create_table

    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS doctors (
        id INTEGER PRIMARY KEY,
        name TEXT
      )
      SQL
    DB[:conn].execute(sql)
  end

  def self.find_by_name(name)
    #This needs to be changed to "find_or_create_by_name"
    sql = <<-SQL
      SELECT *
      FROM doctors
      WHERE name = ?
      LIMIT 1
    SQL

    DB[:conn].ececute(sql, name).map do |row|
      self.new_from_db(row)
    end.first
  end


  def self.create(name)
    doctor = self.new(name)
    doctor.save
  end

  def save
    sql = <<-SQL
      INSERT INTO doctors (name)
      VALUES (?)
      SQL
    DB[:conn].execute(sql, self.name)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM doctors")[0][0]
  end

  def self.new_from_db(row)
    new_doctor = self.new(row[1])
    new_doctor
  end

  def self.find_by_name(name)
    sql = <<-SQL
      SELECT *
      FROM doctors
      WHERE name = ?
      LIMIT 1
    SQL

    DB[:conn].execute(sql, name).map do |row|
      self.new_from_db(row)
    end.first
  end

  def self.all
    # @@all
    sql = <<-SQL
      SELECT *
      FROM doctors
    SQL
    DB[:conn].execute(sql).map do |row|
      self.new_from_db(row)
    end
  end

  def self.find_or_create_by(name)
    result = DB[:conn].execute("SELECT * FROM doctors WHERE name = ?")
    if !result.empty?
      result_data = result[0]
      doct = Doctor.new(result_data[1])
      doct.id = DB[:conn].execute("SELECT last_insert_rowid() FROM doctors")[0][0]
    else
      doctor = Doctor.create(name)
      # binding.pry
    end
    doctor
    # binding.pry
  end


  def appointments
    Appointments.all.find_all do |appt|
      appt.doctor == self
    end
  end

  def patients
    self.appointments.map {|appt| appt.patient}
  end

end
