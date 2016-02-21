# Patient Spec 
# ==============

require "pry"
require "spec_helper"

describe Patient do 
  let(:oct_31) {Appointment.new(patient: "Holly", doctor: "Dr. Love" status: "booked")}
  let(:nov_1) {Appointment.new(patient: "Holly", doctor: "Dr. Love" status: "booked")}

  let(:dr_love) {Doctor.new("Dr. Love")}
  let(:dr_crusher) {Doctor.new("Dr. Beverly Crusher")}

  let(:holly) {Patient.new("Holly")}
  let(:harrison) {Patient.new("Harrison")}

  before do 
    appointment = Appointment.new(patient: holly, doctor: dr_love, status: booked)
    appointment = Appointment.new(patient: holly, doctor: dr_crusher, status: booked)
    appointment = Appointment.new(patient: harrison, doctor: dr_love, status: booked)
  end
binding.pry
  describe "#appointments" do
    it "should return all appointments for patient" do
      expect(holly.appointments.count).to eq(1)
      expect(harrison.appointments.count).to eq(1)
      expect(holly.appointments).to include(oct_31)  
    end
  end

  describe "#doctors" do 
    it "should return all doctors of a patient" do 
      expect(holly.doctors).to include(dr_love)
      expect(harrison.doctors).to include(dr_love)
    end
  end

end

















