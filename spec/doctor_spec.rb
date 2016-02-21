# Doctor Spec
# ============
require "pry"
require "spec_helper"

describe Doctor do
  describe "#initialize=" do 
    let(:appointment) {Appointment.new("booked")}
    let(:doctor) {Doctor.new("Dr. Love")}
    let(:doctor) {Doctor.new("Dr. Beverly Crusher")}

    it "should add the appointment to the doctor" do
      ####





  describe ".find_by_name" do 
    let(:doctor){Doctor.new("Dr. Love")}
    let(:doctor){Doctor.new("Dr. Beverly Crusher")

  it "finds the doctor by name" do
    expect(Doctor.find_by_name("Dr. Love")).to eq (doctor)
  end
end