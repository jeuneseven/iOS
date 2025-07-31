import Foundation

// Class inheritance
@objcMembers class Vehicle { // @objcMembers and @objc means this class and function can be called by Objective-C
    var wheels: Int
    init(wheels: Int) {
        self.wheels = wheels
    }
    
    @objc func printDetail() {
        print("super print")
    }
}
// final means no class can inherit from Truck class
final class Truck: Vehicle {
    var goodsCapacity: Int = 1000
    // optional
    init(wheels: Int, goodsCapacity: Int) {
        self.goodsCapacity = goodsCapacity
        super.init(wheels: wheels)
    }
    
    override func printDetail() {
        print("subclass print")
    }
    
    func copy() -> Truck {
        return Truck(wheels: self.wheels, goodsCapacity: self.goodsCapacity)
    }
}

let truck = Truck(wheels: 4, goodsCapacity: 100)
truck.printDetail()

// Class Copy
var truck1 = Truck(wheels: 4, goodsCapacity: 99)
var truck2 = truck1.copy()
truck1.goodsCapacity = 33
print(truck1.goodsCapacity)
print(truck2.goodsCapacity)

//struct copy
struct GalacticaCrew {
    var isCylon = false
}
var starbuck = GalacticaCrew()
var tyrol = starbuck
tyrol.isCylon = true
print(starbuck.isCylon)
print(tyrol.isCylon)

// deinitializer
class User {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

class Starship {
    var maxWarp = 9.0
}
var voyager = Starship()
voyager.maxWarp = 9.975
var enterprise = voyager
enterprise.maxWarp = 9.6
print(voyager.maxWarp)
print(enterprise.maxWarp)

struct Calculator {
    var currentTotal = 0
}
var baseModel = Calculator()
var casio = baseModel
var texas = baseModel
casio.currentTotal = 556
texas.currentTotal = 384
print(casio.currentTotal)
print(texas.currentTotal)
print(baseModel.currentTotal)

//Mutability
struct Kindergarten {
    var numberOfScreamingKids = 30
    mutating func handOutIceCream() {
        numberOfScreamingKids = 0
    }
}
//must var
var kindergarten = Kindergarten()
kindergarten.handOutIceCream()

class KindergartenClass {
    var numberOfScreamingKids = 30
    func handOutIceCream() {
        numberOfScreamingKids = 0
    }
}
//can be var or let, class can change let instance's property, struct can not
let kindergartenInstance = KindergartenClass()
kindergartenInstance.numberOfScreamingKids = 20
