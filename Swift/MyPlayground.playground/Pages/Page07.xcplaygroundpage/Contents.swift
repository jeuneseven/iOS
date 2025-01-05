// opaque return types

// Optionals

let tableHeight: Double? = 100
if tableHeight! > 85.0 {
    print("The table is too high.")
}

let album = "Red"
let albums = ["Reputation", "Red", "1989"]
if let position = albums.firstIndex(of: album) {
    print("Found \(album) at position \(position).")
}

//Unwrapping with guard
func double(number: Int?) -> Int? {
    guard let number = number else {
        return nil
    }
    return number * 2
}
let input = 5
if let doubled = double(number: input) {
    print("\(input) doubled is \(doubled).")
}

func add3(to number: Int?) -> Int {
    guard let number = number else {
        return 3
    }
    return number + 3
}
let added = add3(to: 5)
print(added)

func username(for id: Int?) -> String? {
    guard let id = id else {
        return nil
    }
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
if let user = username(for: 1989) {
    print("Hello, \(user)!")
}

// unwrap optionals with nil coalescing
let lightsaberColor: String? = "green"
let color = lightsaberColor ?? "blue"

var conferenceName: String? = "WWDC"
var conference: String? = conferenceName ?? nil

let distanceRan: Double? = 0.5
let distance: Double = distanceRan ?? 0

//Failable initializers
var hasForcePowers = "true"
let convertedHasForcePowers = Bool(hasForcePowers)
print(convertedHasForcePowers!)

struct DEFCONRating {
    var number: Int
    init?(number: Int) {
        guard number > 0 else { return nil }
        guard number <= 5 else { return nil }
        self.number = number
    }
}
let defcon = DEFCONRating(number: 6)
print(defcon)

//Typecasting
class Museum {
    var name = "National Museum"
}
class HistoryMuseum: Museum { }
class ToyMuseum: Museum { }
let museum = ToyMuseum()
if let unwrappedMuseum = museum as? ToyMuseum {
    print("This is the \(unwrappedMuseum.name).")
}

class Transport { }
class Train: Transport {
    var type = "public"
}
class Car: Transport {
    var type = "private"
}
let travelPlans = [Train(), Car(), Train()]
for plan in travelPlans {
    if let train = plan as? Train {
        print("We're taking \(train.type) transport.")
    }
}

func process(order: String) {
    print("OK, I'll get your \(order).")
}
let pizzaRequest: String! = "pizza"
process(order: pizzaRequest)

enum NetworkError: Error {
    case insecure
    case noWifi
}
func downloadData(from url: String) throws -> String {
    if url.hasPrefix("https://") {
        return "This is the best Swift site ever!"
    } else {
        throw NetworkError.insecure
    }
}
if let data = try? downloadData(from: "https://www.hackingwithswift.com") {
    print(data)
} else {
    print("Unable to fetch the data.")
}
