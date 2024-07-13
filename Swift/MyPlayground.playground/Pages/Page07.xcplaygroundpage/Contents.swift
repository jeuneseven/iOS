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

//Nil coalescing
let lightsaberColor: String? = "green"
let color = lightsaberColor ?? "blue"

var conferenceName: String? = "WWDC"
var conference: String? = conferenceName ?? nil

let distanceRan: Double? = 0.5
let distance: Double = distanceRan ?? 0
