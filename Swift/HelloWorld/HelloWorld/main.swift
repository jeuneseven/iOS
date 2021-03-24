//
//  main.swift
//  HelloWorld
//
//  Created by kkk on 2019/10/18.
//  Copyright © 2019 kkk. All rights reserved.
//
// 不用编写main函数，swift默认以执行语句的第一句作为程序入口
import Foundation
//打印语句自动换行
print("Hello, World!")
//常量、变量、注释
do {
// 常量
let a = 10
// 变量
var b = 20

var c = a + b

print(c)

    //: 注释

let inta:Int = 30
var intb:Int = 40
    //打印语句的参数
print(a, b, inta, intb, separator: "分隔符", terminator: "\n\n")
    //BOOL为true或false
let bool = true
print(!bool)

let array = [1,3,5,7,9]
print(array)
let anArray = [1, "2", "3", 4] as [Any]
print("anArray==\(anArray)")
let dictionary = ["key":1, "key2": 2]
print(dictionary)

let money:Int = 100_1000
print(money)

let int1:Int8 = 1
let int2:Int16 = 2
let int3 = Int16(int1) + int2

print(int3)

let tuple = (404, "not found")
print("http status is \(tuple)");
print("http status is \(tuple.0)");
print("http status is \(tuple.1)");

let (http_status_code, http_status_message) = tuple
print("http_status_code is \(http_status_code)")

let (httpStatusCode, _) = tuple
print("httpStatusCode is \(httpStatusCode)")

let httpStatus = (statusCode:200, des:"ok")
print(httpStatus.statusCode, httpStatus.des)
}
//流程控制
do {
    let num:Bool = true
    if num {
        print(123)
    }

    while num {
        print(321)
        break;
    }

    repeat {
        print(123321)
        break
    } while num

    for i in 1 ... 3 {
        print(i)
    }

    for i in 1..<5 {
        print(i)
    }

    let a = 3
    let b = 5

    for i in a ... b {
        print(333)
    }

    for _ in 1 ... 4 {
        print("aaa")
    }

    let range = 1...4
    for i in range {
        print("kkk")
    }

    for var i in 1 ... 5 {
        i += 1
        print(i)
    }

    let array = [1, 2, 3, 4, 5]
    for i in array where i < 3 {
        print(array[i])
    }

    for i in [1..<4] {
        print(array[i])
    }

    for i in [1...] {
        print(array[i])
    }

    let array2 = [1, 3, 5 ,6, 8, 10]
    outer: for i in 1 ... 3 {
        if i == array2[i] {
            print("aaaaaaa")
            continue outer
        } else {
            break outer
        }
        
    }


    let aRange = 1...10
    aRange.contains(2)
    aRange.contains(22)

    let rg:Range<String> = "aa"..<"zz"
    rg.contains("ab")

    let rg2:ClosedRange<String> = "10"..."19"
    rg2.contains("11")

    let array1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    for i in stride(from: 2, to: 10, by: 2) {
        print(array1[i])
    }

    enum NSEnum {
        case a, b
    }
    let em = NSEnum.a
    switch em {
    case .a:
        print(a)
        fallthrough
    case .a, .b:
        print(b)
    }

    let string = "a"
    switch string {
    case "a":
        print(123123)
    default:
        break
    }

    let point = (1, 1)
    switch point {
    case (_, 0):
        print("在x轴")
    case (0, _):
        print("在y轴")
    case (0...2, 0...2):
        print("在正方形中")
    case (0, 0):
        print("在原点")
    default:
        print("哪都不在")
    }

    let point1 = (1, -1)
    switch point1 {
    case (let x, let y) where x == y:
        print("x == y")
    case (let x, let y) where x == -y:
        print("x == -y")
    default:
        print("x != y")
    }
}

do {
    func function(para1:Int, para2:Int) -> (sum:Int, avg:Int) {
        let sum = para1 + para2
        
        return (sum, sum>>1)
    }

    let result = function(para1: 10, para2: 20)

    print("sum is \(result.sum), avg is \(result.avg)")

    func function2(at time:String) {
        print("go to work at \(time)");
    }

    function2(at: "2:00")

    func function3(num:Int..., label:Int) {
        print(num);
        print(label)
    }

    function3(num: 1, 2, 3, 4, label: 1)

    var number:Int = 10;
    func function4(num:inout Int) {
        num = 20;
    }

    function4(num: &number);

    print(number)


    func originFunc(param1:Int = 1, param2:Int) {
        print(param1, param2)
    }

    func originFunc(param:Int, param2:Int, param3:Double) {
        print(param, param2, param3)
    }

    originFunc(param: 1, param2: 2, param3: 3.0)

    originFunc(param2: 1)

//    var functionType:(Int, Int)->() = originFunc(param1: 1, param2: 1);

}

struct Point {
    var x:CGFloat = 0.0
    var y:CGFloat = 0.0
    init() {
        self.x = 0.0
        self.y = 0.0
    }
}

var point = Point()

print("point is \(point)")

