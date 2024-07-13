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

