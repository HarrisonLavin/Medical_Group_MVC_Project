class Appointment
  attr_accessor :status, :time, :doctor, :patient
  @@all
  
  def initialize(information)
    @status = "scheduled"
    # @time = time
    # @doctor = doctor
    # @patient = patient
    @time = information.fetch(:time)
    @doctor = information.fetch(:doctor)
    @patient = information.fetch(:patient)
    @@all << self
  end

  def self.all
    @@all
  end


end
