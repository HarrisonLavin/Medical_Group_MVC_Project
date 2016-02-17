class Appointment
  extend Findable
  attr_accessor :status, :date, :doctor, :patient
  @@all = []
  def initialize(information)
    @status = "scheduled"
    # @time = time
    # @doctor = doctor
    # @patient = patient
    @date = information.fetch(:date)
    @doctor = information.fetch(:doctor)
    @patient = information.fetch(:patient)
    @@all << self
  end

  def self.all
    @@all
  end

  def find_appoint(date, doctor, patient)
    find_by_field(date, date) & find_by_field(doctor, doctor) & find_by_field(patient, patient)
  end


end
