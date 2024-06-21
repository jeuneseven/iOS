//variables, simple data types, and string interpolation

var a = 10
var b = 20
print (a + b)
let c = a + b

let boolValue: Bool = true
let boolValue2: Bool = false

if boolValue && !boolValue2 {
    print("hello world \(c)")
}




import UIKit
import PlaygroundSupport

let view = UIView()
view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
view.backgroundColor = UIColor.blue
PlaygroundPage.current.liveView = view


