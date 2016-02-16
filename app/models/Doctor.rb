class Doctor

  attr_reader :name, :age, :specialties
  @@all

  def initialize(name)
    @name = name
    @age = 0
    @specialties = []
    @@all << self
  end

  def self.all
    @@all
  end

  def add_specialty(spec)
    @specialties << spec
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