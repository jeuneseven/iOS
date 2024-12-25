//structs, properties, and methods
struct Employee {
    let name: String
    var vacationRemaining: Int = 14 // default value

    mutating func takeVacation(days: Int) { // if want to change property, must mark func as mutating
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14) // Cannot use mutating member on immutable value: 'archer' is a 'let' constant
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

let kane = Employee(name: "Lana Kane")
let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)

struct EmployeeCompute {
    let name: String
    var vacationAllocated = 14
    var vacationTaken:Int {
        willSet {
            print("currrent vacationTaken is \(newValue)")
        }
        didSet {
            print("vacationTaken was \(oldValue)")
            print("vacationTaken is \(vacationTaken)")
        }
    }
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }

}

var employee = EmployeeCompute(name: "Someone", vacationAllocated: 14, vacationTaken: 0)
employee.vacationTaken += 4
employee.vacationRemaining = 5
print(employee.vacationAllocated)

struct Code {
    var language: String
    var containsErrors = false
    var report: String {
        if containsErrors {
            return "This \(language) code has bugs!"
        } else {
            return "This looks good to me."
        }
    }
}
// create custom initializers
struct City {
    var population: Int
    var area: Int
    var description: String {
        if population < 100_000 {
            return "This is a small city."
        } else if population < 1_000_000 {
            return "This is a medium-sized city."
        } else {
            return "This is a large city."
        }
    }
    
    init(population: Int) {
        self.population = population
        self.area = Int.random(in: 1...1000000)
    }
}

let tokyo = City(population: 12_000_000)
print(tokyo.description, tokyo.area)

//Referring to the current instance
struct Conference {
    var name: String
    var location: String
    init(name: String, location: String) {
        self.name = name
        self.location = location
    }
}
let wwdc = Conference(name: "WWDC", location: "San Jose")
// lazy property
struct DataManager {
    var size: Int
    // define a lazy property
    lazy var data: [String] = {
        var tempData = [String]()
        for i in 0..<size {
            tempData.append("Item \(i)")
        }
        return tempData
    }()
    
    init(size: Int) {
        self.size = size
    }
}

var manager = DataManager(size: 10)
// only init when access data at the first time
print(manager.data)

//Static properties and methods
struct NewsStory {
    static var breakingNewsCount = 0
    static var regularNewsCount = 0
    var headline: String
    init(headline: String, isBreaking: Bool) {
        self.headline = headline
        if isBreaking {
            NewsStory.breakingNewsCount += 1
        } else {
            NewsStory.regularNewsCount += 1
        }
    }
}

struct Doctor {
    var name: String
    var location: String
    private var currentPatient = "No one"
    
    init(name: String, location: String, currentPatient: String = "No one") {
        self.name = name
        self.location = location
        self.currentPatient = currentPatient
    }
}
let drJones = Doctor(name: "Esther Jones", location: "Bristol")

