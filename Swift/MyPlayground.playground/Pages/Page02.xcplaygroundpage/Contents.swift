import math_h
//functions, parameters, and errors

/// The reduce method combines the integers in the numbers array into a single value by applying a function to each one. In our case, that's the + operator, which means "add all these numbers together", giving 25.
let numbers = [1, 3, 5, 7, 9]
let numbersResult = numbers.reduce(0, +)
print(numbersResult) // 25

func greet(_ name: String = "Anonymous") {
    print("Hello, \(name)!")
}

let greetCopy = greet
greetCopy("Dave") // Hello, Dave!

func someFunction() -> Int {
    Int.random(in: 1...3) // same as: return Int.random(in: 1...3)
}

let result = someFunction()
print(result)

// check two strings contains the same letters, regardless their order
func checkStringHasSameLetters(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}

let checkResult = checkStringHasSameLetters(string1: "abc", string2: "cba")
print(checkResult)

func pythagoras(a:Double, b:Double) -> Double {
    sqrt(a * a + b * b)
}

let pythagorasResult = pythagoras(a: 3, b: 4)
print(pythagorasResult)

// return mutiple values: tuple
func getUserName() -> (firstName:String, lastName:String) {
//    (firstName:"seven", lastName:"jeune")
    ("seven", "jeune")
}

let userName = getUserName()
print(userName.firstName, userName.lastName)

func getUserName2() -> (String, String) {
//    (firstName:"seven", lastName:"jeune")
    ("seven", "jeune")
}

let (firstName, _) = getUserName2()
print(firstName) // seven

//customize parameter labels
func countDown(from start: Int = 5) { // = 5 is default value
    var current = start // start is internal parameter name
    while current >= 0 {
        print("\(current)...")
        current -= 1
        print(current)
    }
}
countDown(from: 10)// from is external parameter name

//handle errors in functions
enum CustomError: Error {
    case CustomErrorType1
    case CustomErrorType2
}

func function(from A:String, to B:String) throws -> String {
    if A == "A" {
        throw CustomError.CustomErrorType1
    } else if B == "B" {
        throw CustomError.CustomErrorType2
    }
    
    return "C"
}

do {
    try function(from: "AC", to: "DC")
} catch CustomError.CustomErrorType1 {
    print("CustomError.CustomErrorType1 raised")
} catch CustomError.CustomErrorType2 {
    print("CustomError.CustomErrorType2 raised")
} catch { // must have a final catch
    print("some other errors raised:\(error)")
}
//inout func
func paintWalls(tastefully: Bool, color: inout String) {
    if tastefully {
        color = "cream"
    } else {
        color = "tartan"
    }
}
var color = ""
paintWalls(tastefully: true, color: &color)
