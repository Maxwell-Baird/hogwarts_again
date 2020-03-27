class Professor <ApplicationRecord

  has_many :professor_students
  has_many :students, through: :professor_students

  validates_presence_of :name, :age, :specialty

  def average_age_of_students
    sum = 0.0
    students.each do |student|
      sum += student.age
    end
    average = sum / students.length
    average.round(2)
  end
end
