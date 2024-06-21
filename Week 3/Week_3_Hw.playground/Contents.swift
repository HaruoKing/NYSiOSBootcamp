//Part A

var numss = Array(0...20)
for num in numss {
    if num % 2 == 0 {
        print(num)
    }
}

// Overloaded functions
func average(of numbers: [Int], dividedBy divisor: Int) -> Double {
    let sum = numbers.reduce(0, +)
    let average = Double(sum) / Double(numbers.count * divisor)
    return average
}

func average(of numbers: [Int], adding number: Int) -> Double {
    let sum = numbers.reduce(0, +) + number
    let average = Double(sum) / Double(numbers.count + 1)
    return average
}

// Testing overloaded functions
print(average(of: numss, dividedBy: 2))
print(average(of: numss, adding: 5))


//Part B

enum Animal {
    case cow, dog, cat, lion, bird
}

func soundThatAnimalsmake(_ animal: Animal) {
    switch animal {
    case .cow:
        print("A cow goes moooo.")
    case .dog:
        print("A dog goes woof.")
    case .cat:
        print("A cat goes meow.")
    case .lion:
        print("A lion goes roar.")
    case .bird:
        print("A bird goes tweet.")
    }
}

soundThatAnimalsmake(.cow)
soundThatAnimalsmake(.dog)

//Part C

let nums = Array(0...100)
let numsWithNil: [Int?] = [79, nil, 80, nil, 90, nil, 100, 72]
let numsBy2 = Array(stride(from: 2, through: 100, by: 2))
let numsBy4 = Array(stride(from: 2, through: 100, by: 4))


func evenNumbersArray(from numbers: [Int]) -> [Int] {
    return numbers.filter { $0 % 2 == 0 }
}

print(evenNumbersArray(from: nums))

func sumOfArray(from numbers: [Int?]) -> Int {
    return numbers.compactMap { $0 }.reduce(0, +)
}

print(sumOfArray(from: numsWithNil))

func commonElementsSet(array1: [Int], array2: [Int]) -> Set<Int> {
    let set1 = Set(array1)
    let set2 = Set(array2)
    return set1.intersection(set2)
}

print(commonElementsSet(array1: numsBy2, array2: numsBy4))

//part D

struct Square {
    var sideLength: Double
    
    var area: Double {
        return sideLength * sideLength
    }
}

let square = Square(sideLength: 5.0)
print("The area of the square is \(square.area).")
