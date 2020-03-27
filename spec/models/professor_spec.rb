require 'rails_helper'

RSpec.describe Professor, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :specialty}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:students).through(:professor_students)}
  end

  describe 'instance methods' do
    it '.average_age_of_students' do
      professor = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      student_1 = professor.students.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      student_2 = professor.students.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      student_3 = professor.students.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
      expect(professor.average_age_of_students).to eq(11.33)
    end
  end
end
