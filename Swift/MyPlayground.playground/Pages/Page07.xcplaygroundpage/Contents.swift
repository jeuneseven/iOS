// Optionals

let string1: String = ""
let string2: String? = ""
let string3: String! = ""


/// The namesArr array contains values of type String?, but namesArr.first adds an extra level of optionality because it will return nil if there are no items in the array. So, in this code namesArr.first will return String?? (an optional optional String), of which one layer is unwrapped using the if let.
let namesArr: [String?] = ["Barbara", nil, "Janet", nil, "Peter", nil, "George"]
if let firstName = namesArr.first {
    print(firstName) // Optional("Barbara")
}

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.") // will be printed
}

func square(number: Int) -> Int {
    number * number
}
var number: Int? = nil
// shadowing: mainly used with optional unwraps
if let number = number {
    print(square(number: number))
}

let tableHeight: Double? = 100
if tableHeight! > 85.0 {
    print("The table is too high.")
}

let album = "Red"
let albums = ["Reputation", "Red", "1989"]
if let position = albums.firstIndex(of: album) {
    print("Found \(album) at position \(position).")
}

// Unwrapping optionals with guard
func doubleValue(number: Int?) -> Int? {
    guard let number = number else {
        return nil
    }
    return number * 2
}

print(doubleValue(number: 5)!)

let input = 5
if let doubled = doubleValue(number: input) {
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
// another way: print("Hello, \(username(for: 1989)!)!")
if let user = username(for: 1989) {
    print("Hello, \(user)!")
}

let namesArray = ["Serenity", "Sulaco", "Enterprise", "Galactica"]

if let last = namesArray.last {
    print(last)
}

// unwrap optionals with nil coalescing
let lightsaberColor: String? = "green"
let color = lightsaberColor ?? "blue"

var conferenceName: String? = "WWDC"
var conference: String? = conferenceName ?? nil

let distanceRan: Double? = 0.5
let distance: Double = distanceRan ?? 0

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let someInput = ""
let getNumber = Int(someInput) ?? 0
print(getNumber)

// handle multiple optionals using optional chaining
let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased()
print("Next in line: \(chosen ?? "No one")") // Next in line: BRAN

var someBook: Book? = nil
let getAuthor = someBook?.author?.first?.uppercased() ?? "A"
print(getAuthor)

// handle function failure with optionals
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    if id == 23 {
        return "23"
    } else {
        throw UserError.networkFailed
    }
    
    return ""
}
// don't care what was throws
if let user = try? getUser(id: 23) {
    print("User: \(user)")
}
// care what was throws
do {
    try getUser(id: 22)
} catch {
    print(error)
}

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)

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

class Sport { }
class Swimming: Sport {
    var distance = 100
}
let swimming = Swimming()
if let sport = swimming as? Swimming {
    print("The distance is \(sport.distance).")
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
