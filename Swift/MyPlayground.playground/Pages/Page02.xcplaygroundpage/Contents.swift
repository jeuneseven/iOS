import math_h
//functions, parameters, and errors
func someFunction() -> Int {
    return Int.random(in: 1...3)
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
print(firstName)

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
} catch {
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
