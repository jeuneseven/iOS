// closures

var cleanRoom = { (name: String, by: String) in
    print("I'm cleaning the \(name) by \(by).")
}
cleanRoom("", "")

// Trailing closure syntax

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
