//variables, simple data types, and string interpolation
//arrays, dictionaries, sets, and enums
//operators and conditions
//loops, loops, and more loops

import Foundation

var a = 10
var b = 20
print (a + b)
let c = a + b

let boolValue: Bool = true
let boolValue2: Bool = false

if boolValue && !boolValue2 {
    print("hello world \(c)")
}

var dictionary = [123: 123]
print(dictionary)

var set = ([123, 234])
print(set)

var array:[Int] = [123, 123, 123]
print(array)

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


import UIKit
import PlaygroundSupport

let view = UIView()
view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
view.backgroundColor = UIColor.blue
PlaygroundPage.current.liveView = view


