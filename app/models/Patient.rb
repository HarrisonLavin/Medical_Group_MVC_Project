class Patient

extend Findable
  attr_reader :name, :chart, :id
  @@all = []

  def initialize(name, id=nil)
    @id = id
    @name = name
    @chart = []
    @@all << self
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS patients (
        id INTEGER PRIMARY KEY
        name TEXT
        chart TEXT
      )
      SQL
    DB[:conn].execute(sql)
  end

  def save
    sql = <<-SQL
      INSERT INTO patient (name, chart)
      VALUES (?, ?)
      SQL
    DB[:conn].execute(sql, self.name, self.chart)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM patients")[0][0]
  end

  def self.all
    @@all
  end

  def add_to_chart(status)
    @chart << status
  end

  def appointments
    Appointments.all.find_all do |appt|
      appt.patient == self
    end
  end

  def doctors
    self.appointments.map {|appt| appt.doctor}
  end

end
