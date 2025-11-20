/**
 https://www.hackingwithswift.com/career-guide
 
 Core skills:
    Swift
    SwiftUI(easier, built for Swift, works everywhere, future)
    Working with data, Networking
    Version Control
 Extention skills:
    UIKit(popular, powerful, precise, proven)
    Core Data
    Testing
    Architecture
    Multithreading
 Common mistakes:
    memorizing everything
    shiny object syndrome
    lone wolf learning
    using beta software
    relying on Apple's documentation
    getting lost in Objective-C
    taking shots at other languages
 */

//variables, simple data types, and string interpolation

import Foundation

var a = 10
var b = 20
print(b.isMultiple(of: 10)) // true
print (a + b)
let c = a + b
let d = Int.random(in: 1...10)
print(d)

// float and double value will be clip from end
let aFloatValue: Float = 1457922.33333333333 // 1,457,922
let aDoubleValue: Double = 12381237489173.2374937497932479 // 12,381,237,489,173.24

//operators and conditions

/// Using if case with a range like 100...101 allows us to check whether an integer is inside that range. In this case, it checks whether the value of i (101) is inside the range of numbers 100 and 101 (inclusive), which it is, so "Hello, world!" is printed.
let i = 101

if case 100...101 = i {
    print("Hello, world!") // print
} else {
    print("Goodbye, world!")
}

print(c > 20 ? ">20" : "<=20") // ternary operator

let int_i = 11
let int_j = 20
/// This code uses the ternary operator (?:) and the pattern match operator (~=) to choose one of three names. First, the pattern match operator is used to decide whether the value of int_i (11) is in the range 9...11, which is just the numbers 9, 10, and 11. If the pattern match operator returns true, a second check happens: is the value of int_j (20) divisible by two with a remainder of one? If so, the name Larry is used; if not, Laura. And if the pattern match operator returns false, Libby is used. In this case, the pattern match succeeds but 20 divided by 2 does not leave a remainder of 1, so Laura is used for name.
let nameString = 9...11 ~= int_i ? int_j % 2 == 1 ? "Larry" : "Laura" : "Libby"
print(nameString) // Laura

let boolValue: Bool = true // : Bool is type annotations
let boolValue2: Bool = false

if boolValue && !boolValue2 {
    print("hello world \(c)")
}

var someBool = true
someBool.toggle()
print(someBool) // false

let string = "this is a \"string\""
print(string)

if string.isEmpty {
    print("this is an empty string")
} else {
    print("this is not an empty string")
}

// enums

/// CaseIterable can only synthesize an allCases property when there are no cases with associated values.
enum Weather: CaseIterable {
    case sunny
    case windy
    case rainy
}

print(Weather.allCases.count) // 3

enum Weekday: Int {
    case Monday = 1, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}

var day = Weekday.Monday
day = .Friday
day = .Sunday
print(day)

var someDay: Weekday = .Saturday
print(someDay)

switch day {
case .Monday:
    print(Weekday.Monday)
case .Tuesday:
    print(Weekday.Tuesday)
    fallthrough
case .Wednesday:
    print(Weekday.Wednesday)
case .Thursday:
    print(Weekday.Thursday)
case .Friday:
    print(Weekday.Friday)
    fallthrough
default:
    print("default")
}

//arrays, dictionaries, sets, and enums
var dictionary = [
    "name": "Kai",
    "job" : "Programmer"
]
print(dictionary["job", default: "Unknown"])

var set = ([123, 234])
print(set)

var stringSet: Set = ["1", "2", "3"]
print(stringSet)

var result = ["Red", "Green"] + ["Blue"]
print(result) // ["Red", "Green", "Blue"]

var array:[Int] = [123, 123, 123] // :[Int] is type annotations
var array2 = [Int](arrayLiteral: 1, 2, 3)
var array3 = Array<Int>(arrayLiteral: 1, 2, 3)
var array4:[Any] = ["1", 2, 3.0]
print(array)
print(array2)
print(array3)
print(array4)

var emptyStringArray: [String] = [String]()
var anotherEmptyStringArray = [String]()

var emptyDictionary: [String: String] = [:]
emptyDictionary = Dictionary<String, String>()
var anotherEmptyStringDictionary = [String: String]()

var stringsArray = ["1", "2", "3"]
stringsArray.append("2")
print(stringsArray.count) // 4

let names: [String?] = ["Barbara", nil, "Janet", nil, "Peter", nil, "George"]
let resultArray = names.compactMap { $0 }
print(resultArray) // ["Barbara", "Janet", "Peter", "George"]

var shrinkArray = [1, 2, 3]
print(shrinkArray.count)
shrinkArray.removeAll(keepingCapacity: true)
print(shrinkArray.count)

var tupple = (1, 2)
tupple.0 = 2
print(tupple)

let resultSomething = UInt8.max.addingReportingOverflow(1)
print(resultSomething) // (partialValue: 0, overflow: true)
print(type(of: resultSomething))

var speeds = (65, 58, 72)
for speed in [speeds.0, speeds.1, speeds.2] {
    print("You were driving at \(speed)km/h.")
}

// enum associated values
enum EnumValue {
    case first(value: String)
    case second(value: String)
}

var name = EnumValue.first(value: "aaa")
print(name) // first(value: "aaa")

enum WeatherType {
    case sun
    case cloud
    case rain
    case wind(speed: Int)
    case snow
}

func getStatus(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    case .cloud, .wind:
        return "dislike"
    case .rain, .snow:
        return "hate"
    }
}

print(getStatus(weather: WeatherType.wind(speed: 5)) ?? "")

enum ServerResponse {
    case success(message: String, code: Int)
    case failure(error: String)
    case loading
}

let response1 = ServerResponse.success(message: "OK", code: 200)
let response2 = ServerResponse.failure(error: "Timeout")
let response3 = ServerResponse.loading

switch response1 {
case .success(let message, let code):
    print("Success! Message: \(message), Code: \(code)")
case .failure(let error):
    print("Failure. Error: \(error)")
case .loading:
    print("Loading...")
}

//loops, loops, and more loops

for i in stride(from: 0, to: 10, by: 2) {
    print(i) // 0, 2, 4, 6, 8
}

for i in stride(from: 0, through: 10, by: 2) {
    print(i) // 0, 2, 4, 6, 8, 10
}

for _ in 1...3 {
    print("Hello!")
}

let osArray = ["iOS", "macOS", "tvOS", "watchOS", "iPadOS"]
for os in osArray {
    print("\(os)")
}

for os in 0..<osArray.count {
    print("\(os)")
}

for i in 1...9 {
    print("\(i) * \(i) = \(i * i)")
}

var countDown = 3
while countDown > 0 {
    countDown -= 1
    print(countDown)
}

var count = Int.random(in: 1...5)
while count > 0 { // while loop is useful in looping a unknown count array
    print(count)
    count -= 1
}

var averageScore = 2.5
while averageScore < 15.0 {
    averageScore += 2.5
    print("The average score is \(averageScore)")
}

var bool = true
repeat {
    print(123123)
    bool = false
} while bool

var hoursStudied = 0
var goal = 10
repeat {
    hoursStudied += 1
    if hoursStudied > 4 {
        goal -= 1
        continue
    }
    print("I've studied for \(hoursStudied) hours")
} while hoursStudied < goal

let fibonacci = [1, 1, 2, 3, 5, 8, 13, 21]
var position = 0
while position <= 7 {
    let value = fibonacci[position]
    position += 1
    if value < 2 {
       continue
    }
    print("Fibonacci number \(position) is \(value)")
}

let time4 = 4
let time100 = 100
let time400 = 400

var leapYears = [Int]()

for i in 0...2024 {
    let condition1 = i.isMultiple(of: 4) && !i.isMultiple(of: 100)
    let condition2 = i.isMultiple(of: 100) && i.isMultiple(of: 400)
    if condition1 || condition2 {
        if leapYears.count > 2000 {
            break
        } else {
            leapYears.append(i)
        }
    }
}

print(leapYears)

// FizzBuzz
let range = 1...100
for i in range {
    let isMultipleOf3 = i.isMultiple(of: 3)
    let isMultipleOf5 = i.isMultiple(of: 5)
    if isMultipleOf3 || isMultipleOf5 {
        if isMultipleOf3 && isMultipleOf5 {
            print("FizzBuzz")
        } else if isMultipleOf3 {
            print("Fizz")
        } else if isMultipleOf5 {
            print("Buzz")
        }
    } else {
        print("the number is \(i)")
    }
}

