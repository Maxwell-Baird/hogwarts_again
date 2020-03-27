require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I can see all students at '/students'" do
    student_1 = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    student_2 = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    student_3 = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    professor_1 = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    professor_2 = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    professor_3 = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    ProfessorStudent.create(student_id: student_1.id, professor_id: professor_1.id)
    ProfessorStudent.create(student_id: student_1.id, professor_id: professor_2.id)
    ProfessorStudent.create(student_id: student_1.id, professor_id: professor_3.id)
    ProfessorStudent.create(student_id: student_2.id, professor_id: professor_2.id)
    ProfessorStudent.create(student_id: student_2.id, professor_id: professor_3.id)
    ProfessorStudent.create(student_id: student_3.id, professor_id: professor_1.id)

    visit "/students"

    within("#student-#{student_1.id}") do
      expect(page).to have_content("#{student_1.name}: 3")
    end
    within("#student-#{student_2.id}") do
      expect(page).to have_content("#{student_2.name}: 2")
    end
    within("#student-#{student_3.id}") do
      expect(page).to have_content("#{student_3.name}: 1")
    end
  end
end
