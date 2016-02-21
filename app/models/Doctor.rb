class Doctor
extend Findable
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS doctor (
        id INTEGER PRIMARY KEY
        name TEXT
      )
      SQL
    DB[:conn].execute(sql)
  end


  def self.all
    @@all
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
