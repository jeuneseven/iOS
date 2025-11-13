//
//  ContentView.swift
//  SwiftDataDemo
//
//  Created by seven on 2025/8/31.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student]
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add", systemImage: "plus") {
                    let firstNames = ["A", "B", "C"]
                    let lastNames = ["a", "b", "c"]
                    
                    let randomFirstName = firstNames.randomElement()!
                    let randomLastName = lastNames.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(randomFirstName) \(randomLastName)")
                    
                    modelContext.insert(student)
                    
                    do {
                        try modelContext.save()
                        print("\(student.name)")
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
