require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I can see a professor's students at '/professors/:id'" do

    professor = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    student_1 = professor.students.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    student_2 = professor.students.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    student_3 = professor.students.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
    visit "/professors/#{professor.id}"

    within("#student-#{student_1.id}") do
      expect(page).to have_content(student_1.name)
      expect(page).to have_no_content(student_1.age)
      expect(page).to have_no_content(student_1.house)
    end
    within("#student-#{student_2.id}") do
      expect(page).to have_content(student_2.name)
      expect(page).to have_no_content(student_2.age)
      expect(page).to have_no_content(student_2.house)
    end
    within("#student-#{student_3.id}") do
      expect(page).to have_content(student_3.name)
      expect(page).to have_no_content(student_3.age)
      expect(page).to have_no_content(student_3.house)
    end
  end

  it "I can see a professor's students average age" do

    professor = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    student_1 = professor.students.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    student_2 = professor.students.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    student_3 = professor.students.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
    visit "/professors/#{professor.id}"


    expect(page).to have_content("Average Age: 11.33")

  end
end
