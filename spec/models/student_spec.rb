require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:professors).through(:professor_students)}
  end

  describe 'instance methods' do
    it '.number_of_professors' do
      student = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      professor_1 = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      professor_2 = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
      professor_3 = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
      ProfessorStudent.create(student_id: student.id, professor_id: professor_1.id)
      ProfessorStudent.create(student_id: student.id, professor_id: professor_2.id)
      ProfessorStudent.create(student_id: student.id, professor_id: professor_3.id)

      expect(student.number_of_professors).to eq(3)
    end
  end
end
