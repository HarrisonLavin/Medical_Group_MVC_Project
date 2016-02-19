# Appointment Spec 
# ===================

require "spec_helper"
  binding.pry
  describe Appointment do 
    describe "#initialize=" do
      let(:doctor) {Doctor.new("Dr. Love")}
      let(:patient) {Patient.new("Holly")}
      let(:date) {"Oct 31st"}
      let(:appointment) {Appointment.new ({doctor:doctor,
        patient:patient, date:date})}

    it "sets the correct doctor and patient" do
      appointment.doctor = doctor
      expect(appointment.doctor).to eq(doctor)
      # trigger

      appointment.patient = patient
      expect(appointment.patient).to eq(patient)

      appointment.date = date
      expect(appointment.date).to eq ("Oct 31st")
    end


  end
end


