class Patient

  attr_reader :name, :chart
  @@all = []

  def initialize(name)
    @name = name
    @chart = []
    @@all << self
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