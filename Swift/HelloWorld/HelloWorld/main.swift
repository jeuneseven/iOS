//
//  main.swift
//  HelloWorld
//
//  Created by kkk on 2019/10/18.
//  Copyright © 2019 kkk. All rights reserved.
//
// 不用编写main函数，swift默认以执行语句的第一句作为程序入口
import Foundation

//空合并运算符

let aNum:Int? = 10
let bNum:Int? = 11
//类似于a != nil || b != nil
if let c = aNum ?? bNum {
    print(c)
}
//类似于a != nil && b != nil
if let c = aNum, let d = bNum {
    print(c, d)
}
/*
 a ?? b
 a 必须是可选项，b可以是可以不是
 a不为nil时返回a，否则返回b
 a为nil时返回b
 b不是可选项的话，返回a的解包
 多个??一起使用的时候，看最右边的类型
 */
let a:Int? = 10
let b:Int = 11
let c = a ?? b
print(c)

if let a = Int("1"),
    let b = Int("2"),
    a < b {
    print(a, b);
}
//可选项绑定
if let number1 = Int("111") {
    print("转换成功 \(number1)")
} else {
    print("转换失败！")
}
//与上方等价
let number1 = Int("111")

if number1 != nil {
    print("转换成功 \(number1!)")
} else {
    print("转换失败！")
}
//强制解包！
var intA:Int? = 11
var intB = intA! + 10
print(intB, intA)
//可选项的应用
var array = [1, 2, 3]
func get(_ index:Int) -> Int? {
    if index < 0 || index > array.count {
        return nil
    }
    return array[index]
}

print(get(-1))
print(get(0))

//可选项
var name:String? = "aaa"
name = nil
var number:Int?
print(name, number)


enum Password {
    case number(Int, Int, Int, Int)
    case other
}

var pwd = Password.number(1, 2, 3, 4)

print(MemoryLayout<Password>.size)//变量实际占用的大小
print(MemoryLayout<Password>.stride)//实际用到的大小
print(MemoryLayout<Password>.alignment)//内存对齐参数
print(MemoryLayout.size(ofValue: pwd));

var inta = 10
//查看内存大小
print(MemoryLayout<Int>.size)
print(MemoryLayout<Int>.stride)
print(MemoryLayout<Int>.alignment)

print(MemoryLayout.size(ofValue: inta));

//递归枚举
indirect enum ArithExp {
    case number(Int)
    case sum(ArithExp, ArithExp)
}

//原始值，类型为Int、String时，会自动分配原始值
enum Direction : String {
    case north = "N"
    case south = "S"
    case west = "W"
    case east = "E"
}

var direction = Direction.north
print(direction.rawValue)
print("");


//关联值枚举
enum Score {
    case points(Int)
    case grade(Character)
}

var score = Score.points(95)
score = .grade("A")
print(score)

//开启编译器优化后，即使代码很长，也会被内联(递归、动态派发除外)
@inline(__always) func funB() {
    
}

//永远不会被内联
//@inline(never) func funA()_{
//    print("")
//}

//嵌套函数
func otherForward(_ forward:Bool) -> (Int) -> Int {
    func next(_ input:Int) -> Int {
        input + 1
    }

    func previous(_ input:Int) -> Int {
        input - 1
    }
    
    return forward ? next : previous
}
print(otherForward(true)(4))
print(otherForward(false)(4))

//给类型起别名
typealias IntFn = (Int, Int) -> Int
//函数类型还可以作为返回值
func next(_ input:Int) -> Int {
    input + 1
}

func previous(_ input:Int) -> Int {
    input - 1
}
//返回值是函数类型的函数，称为高阶函数
func forward(_ forward:Bool) -> (Int) -> Int {
    forward ? next : previous
}

print(forward(true)(4))
print(forward(false)(4))

//函数类型
func sum(a:Int, b:Int) -> Int {
    a + b
}

var fn:(Int, Int) -> Int = sum;
print(fn(1, 2));

//函数体比较长就不会被内联
//包含递归调用不会被内联
//包含动态派发（OC中的动态绑定）不会被内联
func test() {
    print("123123");
}

test()

//打印语句自动换行
print("Hello, World!")
//常量、变量、注释
do {
// 常量 不要求在编译时确定
let a = 10
// 变量
var b = 20

var c = a + b

print(c)

// markup语法只在playground中支持
//: 注释
/*:
     # 一级标题
     ## 二级标题
     ### 三级标题
     /*
     注释可以嵌套
     */
*/
    
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
    if num {//条件只能是布尔类型
        print(123)
    }

    while num {
        print(321)
        break;
    }
    //相当于do while
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
    
    for i in array[0 ... 3] {
        print(i);
    }
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
    //case和default后面至少要有一条语句，；不算一条语句
    //switch必须要能保证处理所有情况
    switch em {
    case .a://默认没有大括号
        print(a)
        fallthrough//实现贯穿效果
    case .a, .b://复合条件
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
    /*
     可变参数不能标记为inout
     inout参数不能有默认值
     inout参数只能传入可以被多次赋值的，例如字面量就不可以
     本质为地址传递，即引用传递
     如果传递给inout的是计算属性、有监听器的属性等内容，其本质不是引用传递
     */
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

