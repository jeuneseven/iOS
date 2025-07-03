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
//Closure cannot have keyword arguments
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
let captainFirstTeamWithTrailingClousure = team.sorted{
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

let testArray = ["Ashdsj", "Basjdiasj", "Casjdlasjdl"]
let filterArray = testArray.filter{
    $0.hasPrefix("A")
}
print(filterArray) // ["Ashdsj"]

let mapArray = testArray.map{
    $0.uppercased()
}
print(mapArray) // ["ASHDSJ", "BASJDIASJ", "CASJDLASJDL"]

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

