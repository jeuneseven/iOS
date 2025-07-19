//
//  ContentView.swift
//  Navigation
//
//  Created by seven on 2025/7/16.
//

import SwiftUI

//struct Student: Hashable {
//    var id = UUID()
//    var name: String
//    var age: Int
//}
//
//struct DetailView: View {
//    var number: Int
//
//    var body: some View {
//        Text("Detail View \(number)")
//    }
//
//    init(number: Int) {
//        self.number = number
//        // DetailView will be created a lot of times
//        print("Creating detail view \(number)")
//    }
//}

@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")

    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }

        // Still here? Start with an empty path.
        path = NavigationPath()
    }

    func save() {
        guard let representation = path.codable else { return }
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}
//class PathStore {
//    var path: [Int] {
//        didSet {
//            save()
//        }
//    }
//
//    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
//
//    init() {
//        if let data = try? Data(contentsOf: savePath) {
//            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
//                path = decoded
//                return
//            }
//        }
//
//        // Still here? Start with an empty path.
//        path = []
//    }
//
//    func save() {
//        do {
//            let data = try JSONEncoder().encode(path)
//            try data.write(to: savePath)
//        } catch {
//            print("Failed to save navigation data")
//        }
//    }
//}

struct DetailView: View {
    var number: Int
//    @Binding var path: [Int]
//    @Binding var path: NavigationPath
//    @State private var path = [Int]()

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...10))
                    .navigationTitle("Number: \(number)")
//        NavigationLink("Go to Random Number", value: Int.random(in: 1...10))
//            .navigationTitle("Number: \(number)")
//            .toolbar {
////                Button("Home") {
////                    path = NavigationPath()
////                }
//                Button("Home") {
//                    path.removeAll()
//                }
//            }
    }
}

struct ContentView: View {
    // can save the path when app relaunch
//    @State private var pathStore = PathStore()
//    @State private var path = [Int]()
    
//    @State private var path = NavigationPath()

    var body: some View {
        
        
//        NavigationStack {
//            List(0..<100) { i in
//                Text("Row \(i)")
//            }
//            .navigationTitle("Title goes here")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbarBackground(.blue, for: .navigationBar)
//            .toolbarColorScheme(.dark, for: .navigationBar)
////            .toolbar(.hidden, for: .navigationBar)
//        }
        
//        NavigationStack(path: $pathStore.path) {
//            DetailView(number: 0)
//                .navigationDestination(for: Int.self) { i in
//                    DetailView(number: i)
//                }
//        }
        
//        NavigationStack(path: $path) {
//            DetailView(number: 0, path: $path)
//                .navigationDestination(for: Int.self) { i in
//                    DetailView(number: i, path: $path)
//                }
//        }
        
//        // Navigating to different data types
//        NavigationStack(path: $path) { // secode way use NavigationPath
//            List {
//                ForEach(0..<5) { i in
//                    NavigationLink("Select Number: \(i)", value: i)
//                }
//
//                ForEach(0..<5) { i in
//                    NavigationLink("Select String: \(i)", value: String(i))
//                }
//            }
//            .toolbar {
//                Button("Push 556") {
//                    path.append(556)
//                }
//
//                Button("Push Hello") {
//                    path.append("Hello")
//                }
//                
//                Button("Show 556 then Hello") {
//                    path.append(556)
//                    path.append("Hello")
//                }
//            }// first way use navigationDestination() with different data types
//            .navigationDestination(for: Int.self) { selection in
//                Text("You selected the number \(selection)")
//            }
//            .navigationDestination(for: String.self) { selection in
//                Text("You selected the string \(selection)")
//            }
//        }
        
//        // You can mix user navigation and programmatic navigation as much as you want – SwiftUI will take care of making sure your path array stays in sync with whatever data you show, regardless of how it's shown.
//        NavigationStack(path: $path) {
//            VStack {
//                Button("Show 32") {
//                    path = [32]
//                }
//
//                Button("Show 64") {
//                    path.append(64)
//                }
//                
//                Button("Show 32 then 64") {
//                    path = [32, 64]
//                }
//            }
//            .navigationDestination(for: Int.self) { selection in
//                Text("You selected \(selection)")
//            }
//        }
        
//        NavigationStack {
//            List(0..<10) { i in
//                    NavigationLink("Select \(i)", value: i)
//            }
////            .navigationDestination(for: Int.self) { selection in
////                Text("You selected \(selection)")
////            }
//            // navigationDestination must conform Hashable protocol
//            .navigationDestination(for: Student.self) { student in
//                Text("You selected \(student.name)")
//            }
//        }
        
//        // simplest form of SwiftUI navigation
//        NavigationStack {
//            NavigationLink("Tap Me") {
//                Text("Detail View")
//            }
//        }
        
//        NavigationStack {
//            List(0..<1000) { i in
//                NavigationLink("Tap Me") {
//                    DetailView(number: i)
//                }
//            }
//        }
    }
}

#Preview {
    ContentView()
}
