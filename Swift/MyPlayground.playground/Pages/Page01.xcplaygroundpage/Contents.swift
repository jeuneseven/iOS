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

//operators and conditions
print(c > 20 ? ">20" : "<=20") // ternary operator

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
enum Weekday {
    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
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

var array:[Int] = [123, 123, 123] // :[Int] is type annotations
var array2 = [Int](arrayLiteral: 1, 2, 3)
var array3 = Array<Int>(arrayLiteral: 1, 2, 3)
print(array)
print(array2)
print(array3)

var emptyStringArray: [String] = [String]()
var anotherEmptyStringArray = [String]()

var emptyDictionary: [String: String] = [:]
emptyDictionary = Dictionary<String, String>()
var anotherEmptyStringDictionary = [String: String]()

var stringsArray = ["1", "2", "3"]
stringsArray.append("2")
print(stringsArray.count) // 4

var shrinkArray = [1, 2, 3]
print(shrinkArray.count)
shrinkArray.removeAll(keepingCapacity: true)
print(shrinkArray.count)

var tupple = (1, 2)
tupple.0 = 2
print(tupple)

enum EnumValue {
    case first(value: String)
    case second(value: String)
}

var name = EnumValue.first(value: "aaa")
print(name)

//loops, loops, and more loops

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

var bool = true
repeat {
    print(123123)
    bool = false
} while bool

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

