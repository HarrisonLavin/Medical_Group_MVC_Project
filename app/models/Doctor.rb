class Doctor
extend Findable
  attr_reader :name, :id
  @@all = []

  def initialize(name, id=nil)
    @id = id
    @name = name
    @@all << self
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS doctors (
        id INTEGER PRIMARY KEY
        name TEXT
      )
      SQL
    DB[:conn].execute(sql)
  end

  def save
    sql = <<-SQL
      INSERT INTO doctor (name)
      VALUES ?
      SQL
    DB[:conn].execute(sql, self.name)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM doctors")[0][0]
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
