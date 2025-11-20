//: [Previous](@previous)

import Foundation

let names = ["Terry Jones", "John Terry", "Terry Crews", "Terry Farrell", "Samuel Terry"]

var array: [String] = []

for name in names {
    if name.hasPrefix("Terry") {
        array.append(name)
    }
}

print(array)

//: [Next](@next)
