require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I can see all students at '/students'" do

    professor = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    student_1 = professor.students.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    student_2 = professor.students.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    student_3 = professor.students.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    visit "/students"

    within("#student-#{student_1.id}") do
      expect(page).to have_content("#{student_1.name}: #{student_1.age}")
    end
    within("#student-#{student_2.id}") do
      expect(page).to have_content("#{student_2.name}: #{student_2.age}")
    end
    within("#student-#{student_3.id}") do
      expect(page).to have_content("#{student_3.name}: #{student_3.age}")
    end
  end
end
