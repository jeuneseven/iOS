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
print(b .isMultiple(of: 10)) // true
print (a + b)
let c = a + b

//operators and conditions

let boolValue: Bool = true
let boolValue2: Bool = false

if boolValue && !boolValue2 {
    print("hello world \(c)")
}

let string = "this is a \"string\""
print(string)

// enums
enum Weekday {
    case Monday, Tuesday, Wednesday, Thursday, Friday
}

var day = Weekday.Monday
day = .Tuesday
print(day)

//arrays, dictionaries, sets, and enums
var dictionary = [123: 123]
print(dictionary[0, default: 0])

var set = ([123, 234])
print(set)

var array:[Int] = [123, 123, 123]
var array2 = [Int](arrayLiteral: 1, 2, 3)
var array3 = Array<Int>(arrayLiteral: 1, 2, 3)
print(array)
print(array2)
print(array3)

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

var bool = true

repeat {
    print(123123)
    bool = false
} while bool

