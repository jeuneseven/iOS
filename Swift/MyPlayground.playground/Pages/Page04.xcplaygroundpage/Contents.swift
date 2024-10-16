//structs, properties, and methods
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

struct City {
    var population: Int
    var description: String {
        if population < 100_000 {
            return "This is a small city."
        } else if population < 1_000_000 {
            return "This is a medium-sized city."
        } else {
            return "This is a large city."
        }
    }
}

let tokyo = City(population: 12_000_000)
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

