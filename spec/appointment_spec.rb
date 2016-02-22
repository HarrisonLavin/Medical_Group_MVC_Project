# Appointment Spec 
# ===================
require "pry"
require "spec_helper"
  describe Appointment do 
    describe "#initialize=" do
      let(:doctor) {Doctor.new("Dr. Love")}
      let(:patient) {Patient.new("Holly")}
      let(:day) {"Oct 31st"}
      let(:appointment) {Appointment.new ({doctor:doctor,
        patient:patient, day:day})}

    it "sets the correct doctor and patient" do
      appointment.doctor = doctor
      expect(appointment.doctor).to eq(doctor)
      # trigger
      appointment.patient = patient
      expect(appointment.patient).to eq(patient)

      appointment.day = day
      expect(appointment.day).to eq ("Oct 31st")
    end
  end

  describe "#create_table" do 
    it "creates the appointment table in the database" do 
      Appointment.create_table
      table_check_sql = "SELECT tbl_name FROM sqlite_master WHERE type='table' AND tbl_name='appointments';"
      expect(DB[:conn].execute(table_check_sql)[0]).to eq(['appointments'])
    end
  end

  describe "#save" do 
    let(:doctor) {Doctor.new("Dr. Love")}
      let(:patient) {Patient.new("Holly")}
      let(:day) {"Oct 31st"}
      let(:appointment) {Appointment.new ({doctor:doctor,
        patient:patient, day:day})}

    it "saves an instance of appointment class in the table" do 
      oct_31= appointment
      # binding.pry
      Appointment.create_table
      oct_31.save
      expect(oct_31.id).to eq(1)
      expect(DB[:conn].execute("SELECT * FROM appointments")).to eq([[1, "Oct 31st", "booked"]])
    end
  end

  describe "#all" do 
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

  describe "#find_appoint" do
    let(:doctor) { Doctor.new("Dr. Love")}
    let(:day) {"Oct 31st"}
    let(:patient){Patient.new("Holly")}

    it "finds the appointment" do
      Appointment.all.clear
      doctor 
      patient
      day
      expect(Appointment.find_appoint("doctor")).to eq (doctor)
    end
  end

end


