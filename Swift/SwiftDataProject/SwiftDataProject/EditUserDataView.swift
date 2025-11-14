//
//  EditUserDataView.swift
//  SwiftDataProject
//
//  Created by seven on 2025/9/1.
//

import SwiftUI
import SwiftData

struct EditUserDataView: View {
    @Bindable var user: UserModel
    
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
        let container = try ModelContainer(for: UserModel.self, configurations:config)
        return EditUserDataView(user: UserModel.example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create user \(error.localizedDescription)")
    }
}
