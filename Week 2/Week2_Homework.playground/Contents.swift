//Part A
var nums = Array(0...20)
for num in nums {
    if num % 2 == 0 {
        print(num)
    }
}

// Part B
let sentence = "The qUIck bRown fOx jumpEd over the lAzy doG"
var vowelCount = 0
for char in sentence.lowercased() {
    if "aeiou".contains(char) {
        vowelCount += 1
    }
}
print("Number of vowels: \(vowelCount)")

// Part C
let array1 = Array(0...4)
let array2 = Array(0...4)
for num1 in array1 {
    for num2 in array2 {
        print("\(num1) * \(num2) = \(num1 * num2)")
    }
}

// Part D
func average(of numbers: [Int]?) {
    if let numbers = numbers {
        let sum = numbers.reduce(0, +)
        let average = (sum) / (numbers.count)
        print("The average of the values in the array is \(average).")
    } else {
        print("The array is nil. Calculating the average is impossible.")
    }
}

average(of: nums)
average(of: nil)

// Part E
struct Person {
    var firstName: String
    var lastName: String
    var age: Int
    
    func details() {
        print("Name: \(firstName) \(lastName), Age: \(age)")
    }
}

let person = Person(firstName: "Victor", lastName: "Rodriguez", age: 30)
person.details()

// Part F
class Student {
    var person: Person
    var grades: [Int]
    
    init(person: Person, grades: [Int]) {
        self.person = person
        self.grades = grades
    }
    
    func calculateAverageGrade() -> Double {
        let sum = grades.reduce(0, +)
      return Double((sum)) / Double(grades.count)
    }
    
    func details() {
      let averageGrade = calculateAverageGrade()
        print("Name: \(person.firstName) \(person.lastName), Age: \(person.age), GPA: \(averageGrade)")
    }
}

let student = Student(person: person, grades: [94, 99, 81, 100, 79])
student.details()


