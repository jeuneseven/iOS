// closures

var cleanRoom = { (name: String, by: String) in
    print("I'm cleaning the \(name) by \(by).")
}
cleanRoom("", "")

// Trailing closure syntax

func holdClass(name: String, lesson: () -> Void) {
    print("Welcome to \(name)!")
    lesson()
    print("Make sure your homework is done by next week.")
}
holdClass(name: "Philosophy 101", lesson: {
    print("All we are is dust in the wind, dude.")
})
//holdClass("Philosophy 101", lesson:) {
//    print("All we are is dust in the wind, dude.")
//}

func tendGarden(activities: () -> Void) {
    print("I love gardening")
    activities()
}

tendGarden(activities: {
    print("Let's grow some roses!")
})

tendGarden {
    print("Let's grow some roses!")
}
