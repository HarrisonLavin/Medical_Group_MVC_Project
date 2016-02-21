# Appointment Spec 
# ===================
require "pry"
require "spec_helper"
  describe Appointment do 
    describe "#initialize=" do
      let(:doctor) {Doctor.new("Dr. Love")}
      let(:patient) {Patient.new("Holly")}
      let(:date) {"Oct 31st"}
      let(:appointment) {Appointment.new ({doctor:doctor,
        patient:patient, date:date})}

    it "sets the correct doctor and patient" do
      appointment.doctor = doctor
      # variable to trues
      expect(appointment.doctor).to eq(doctor)
      # trigger

      appointment.patient = patient
      expect(appointment.patient).to eq(patient)

      appointment.date = date
      expect(appointment.date).to eq ("Oct 31st")
    end
  end

  describe ".all" do 
    before do 
      Appointment.all.clear
      Appointment.new
      Appointment.new
    end

    it "returns all of the appointments that have been
    initialized" do 
    expect(Appointment.all.count).to eq(2)
    end
  end

  

end


