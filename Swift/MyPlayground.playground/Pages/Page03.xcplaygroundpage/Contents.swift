// closures
func greatUser() {
    print("Hi")
}
greatUser()
var greatCopy:()->Void = greatUser // copy a function do not use (), it means get the function's return value
greatCopy()

let sayHello = { (name: String) -> String in
    "Hi \(name)"
}

sayHello("Kai")
// Closure cannot have keyword arguments
// "in" is the keyword, it marks the end of parameters and return type
var cleanRoom = { (name: String, by: String) -> (String) in
    print("I'm cleaning the \(name) by \(by).")
    return "the end"
}
print(cleanRoom("room", "myself"))

let team = ["A", "B", "C", "X", "Y", "Z"]
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Z" {
        return true
    } else if name2 == "Z" {
        return false
    }
    
    return name1 < name2
}

let captainFirstTeam = team.sorted(by: captainFirstSorted(name1:name2:))
print(captainFirstTeam) // ["Z", "A", "B", "C", "X", "Y"]

let captainFirstTeamWithClousure = team.sorted(by: {(name1: String, name2: String) -> Bool in
    if name1 == "Z" {
        return true
    } else if name2 == "Z" {
        return false
    }
    
    return name1 < name2
})
print(captainFirstTeamWithClousure) // ["Z", "A", "B", "C", "X", "Y"]

// Trailing closure syntax
let captainFirstTeamWithTrailingClousure = team.sorted {
    if $0 == "Z" {
        return true
    } else if $1 == "Z" {
        return false
    }
    
    return $0 < $1
}
print(captainFirstTeamWithTrailingClousure)

// Trailing closure shorthand syntax
let captainFirstTeamWithTrailingShorthandClousure = team.sorted{$0 < $1}
print(captainFirstTeamWithTrailingShorthandClousure) // ["A", "B", "C", "X", "Y", "Z"]

// simple examples of filter, map, reduce
let testArray = ["Ashdsj", "Basjdiasj", "Casjdlasjdl"]
let filterArray = testArray.filter {
    $0.hasPrefix("A")
}
print(filterArray) // ["Ashdsj"]

let mapArray = testArray.map {
    $0.uppercased()
}
print(mapArray) // ["ASHDSJ", "BASJDIASJ", "CASJDLASJDL"]

/// The reduce method combines the integers in the numbers array into a single value by applying a function to each one. In our case, that's the + operator, which means "add all these numbers together", giving 25.
let numbers = [1, 3, 5, 7, 9]
let numbersResult = numbers.reduce(0, +) // 0 is the initial value
print(numbersResult) // 25

// complex examples of filter, map, reduce, compact map and flat map
struct App {
    let name: String
    let price: Double
    let users: Int
}

let appPortfolio = [
    App(name: "A", price: 10, users: 123),
    App(name: "B", price: 9, users: 321),
    App(name: "C", price: 8, users: 12345),
    App(name: "D", price: 7, users: 54321),
    App(name: "E", price: 6, users: 2345),
    App(name: "F", price: 5, users: 5432),
    App(name: "G", price: 0.00, users: 6789)
]

let freeApps = appPortfolio.filter { $0.price == 0.00 }
print(freeApps) // [__lldb_expr_14.App(name: "G", price: 0.0, users: 6789)]

let appNames = appPortfolio.map { $0.name }.sorted()
print(appNames) // ["A", "B", "C", "D", "E", "F", "G"]

let increasePrices = appPortfolio.map { $0.price * 1.1 }
print(increasePrices) // [11.0, 9.9, 8.8, 7.700000000000001, 6.6000000000000005, 5.5, 0.0]

let totalUsers = appPortfolio.reduce(0, {$0 + $1.users})
print(totalUsers) // 81676

let recurringRevenue = appPortfolio.map { $0.price * Double($0.users) }.reduce(0, +)
print(recurringRevenue) // 524356.0

let nilNumbers = [0, nil, 1, nil, 2, nil, 3]
let nonNilNumbers = nilNumbers.compactMap { $0 }
print(nonNilNumbers) // [0, 1, 2, 3]

let arrayOfArrays: [[Int]] = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

let singleArray = arrayOfArrays.flatMap { $0.map { $0 * 2} }
print(singleArray) // [2, 4, 6, 8, 10, 12, 14, 16, 18]

func doSomething(first:() -> Void, second:() -> Void, third:() -> Void) {
    print("1")
    first()
    print("2")
    second()
    print("3")
    third()
}
doSomething(first: {
    print("first")
}, second: {
    print("second")
}, third: {
    print("third")
})

/**
 
 Your input is this:

 let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
 Your job is to:

 Filter out any numbers that are even
 Sort the array in ascending order
 Map them to strings in the format “7 is a lucky number”
 Print the resulting array, one item per line
 So, your output should be as follows:

 7 is a lucky number
 15 is a lucky number
 21 is a lucky number
 31 is a lucky number
 33 is a lucky number
 49 is a lucky number
 
 */
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
let evenNumbers = luckyNumbers.filter{
    $0.isMultiple(of: 2)
}
print(evenNumbers)

let sortedArray = luckyNumbers.sorted {
    $0 < $1
}
print(sortedArray)

let mapedArray: [()] = luckyNumbers.map{
    print("\($0) is a lucky number")
}
print(mapedArray)

func holdClass(name: String, lesson: () -> Void) {
    print("Welcome to \(name)!")
    lesson()
    print("Make sure your homework is done by next week.")
}
holdClass(name: "Philosophy 101", lesson: {
    print("All we are is dust in the wind, dude.")
})
//holdClass("Philosophy 101", lesson:) {
//    print("All we are is dust in the wind, dude.")
//}

func tendGarden(activities: () -> Void) {
    print("I love gardening")
    activities()
}

tendGarden(activities: {
    print("Let's grow some roses!")
})

tendGarden {
    print("Let's grow some roses!")
}

func getMeasurement(handler: (Double) -> Void) {
    let measurement = 32.2
    handler(measurement)
}
getMeasurement { (measurement: Double) in
    print("It measures \(measurement).")
}

func processPrimes(using closure: (Int) -> Void) {
    let primes = [2, 3, 5, 7, 11, 13, 17, 19]
    for prime in primes {
        closure(prime)
    }
}
processPrimes { (prime: Int) in
    print("\(prime) is a prime number.")
    let square = prime * prime
    print("\(prime) squared is \(square)")
}

func manipulate(numbers: [Int], using algorithm: (Int) -> Int) {
    for number in numbers {
        let result = algorithm(number)
        print("Manipulating \(number) produced \(result)")
    }
}
manipulate(numbers: [1, 2, 3]) { number in
    return number * number
}

func scoreToGrade(score: Int, gradeMapping: (Int) -> String) {
    print("Your score was \(score)%.")
    let result = gradeMapping(score)
    print("That's a \(result).")
}
scoreToGrade(score: 80) { (grade: Int) in
    if grade < 85 {
        return "Fail"
    }
    
    return "0"
}

func goShopping(for item: String, decisionHandler: (String) -> Bool) {
    print("I'm going to buy \(item)")
    let returnValue = decisionHandler(item)
    if returnValue == true {
        print("Great! I bought them.")
    } else {
        print("Maybe next time...")
    }
}

goShopping(for: "shoes") { item in
    if item == "shoes" {
        return false
    } else {
        return true
    }
}

func createValidator() -> (String) -> Bool {
    return {
        if $0 == "twostraws" {
            return true
        } else {
            return false
        }
    }
}
let validator = createValidator()
print(validator("twostraws"))

// Returning closures from functions

func makeGreeting(language: String) -> (String) -> Void {
if language == "French" {
    return {
        print("Bonjour, \($0)!")
    }
} else {
    return {
        print("Hello, \($0)!")
    }
}
}
let greeting = makeGreeting(language: "English")
greeting("Paul")

//Capturing values
func storeTwoValues(value1: String, value2: String) -> (String) -> String {
    var previous = value1
    var current = value2
    return { new in
        let removed = previous
        previous = current
        current = new
        return "Removed \(removed)"
    }
}
let store = storeTwoValues(value1: "Hello", value2: "World")
let removed = store("Value Three")
print(removed)

func visitPlaces() -> (String) -> Void {
    var places = [String: Int]()
    return {
        places[$0, default: 0] += 1
        let timesVisited = places[$0, default: 0]
        print("Number of times I've visited \($0): \(timesVisited).")
    }
}
let visit = visitPlaces()
visit("London")
visit("New York")
visit("London")

