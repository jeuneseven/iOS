//
//  EditUserView.swift
//  SwiftDataProject
//
//  Created by seven on 2025/8/20.
//

import SwiftUI
import SwiftData

struct EditUserView: View {
    @Bindable var user: User
    
    var body: some View {
        Form {
            TextField("Name", text: $user.name)
            TextField("City", text: $user.city)
            
            DatePicker("Join Date", selection: $user.joinDate)
        }
        .navigationTitle("Edit User")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        let user = User(name: "Kai Lee", city: "Auckland", joinDate: .now)
        return EditUserView(user: user)
            .modelContainer(container)
    } catch {
        return Text(error.localizedDescription)
    }
}
