# Doctor Spec
# ============
require "pry"
require "spec_helper"

describe Doctor do
  describe "#initialize=" do 
    let(:oct_31) {Appointment.new(patient: "Holly", doctor: "Dr. Love", status: "booked")}
    let(:nov_1) {Appointment.new(patient: "Holly", doctor: "Dr. Love", status: "booked")}
    ## revisit all of this. 

    let(:dr_love) {Doctor.new("Dr. Love")}
    let(:dr_crusher) {Doctor.new("Dr. Beverly Crusher")}

    let(:holly) {Patient.new("Holly")}
    let(:harrison) {Patient.new("Harrison")}

    before do 
      appointment = Appointment.new(patient: holly, doctor: dr_love, date: oct_31)
      appointment = Appointment.new(patient: holly, doctor: dr_crusher, date: oct_31)
      appointment = Appointment.new(patient: harrison, doctor: dr_love, date: nov_1)  
    end
  end

  describe "#create_table" do 
    it "creates the doctor table in the database" do 
      Doctor.create_table
      table_check_sql = "SELECT tbl_name FROM sqlite_master WHERE type='table' AND tbl_name='doctors';"
      expect(DB[:conn].execute(table_check_sql)[0]).to eq(['doctors'])
    end
  end

  describe "#save" do 
    it "saves an instance of Doctor class in the table" do 
      Doctor.create_table
      dr_love.save
      expect(dr_love.id).to eq(1)
      expect(DB[:conn].execute("SELECT * FROM doctors")).to eq([[1, "Dr Love", "???"]])
    end
  end

  describe "#find_by_name" do 
    let(:doctor){Doctor.new("Dr. Love")}
    let(:doctor){Doctor.new("Dr. Beverly Crusher")}

  it "finds the doctor by name" do
    expect(Doctor.find_by_name("Dr. Love")).to eq (doctor)
    end
  end

  # describe "#appointments" do
  #   it "should return the doctors appointments"
  #   let(:appointment) {Appointment.new("Oct 31st")}
  #   let(:appointment) {Appointment.new("Nov 1st")}

  #   it "finds all the doctor's appointments" do 
  #     Appointment.all.clear
  #   end
  # end
end