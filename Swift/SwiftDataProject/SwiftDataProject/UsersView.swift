//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by seven on 2025/9/1.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Query var users: [UserModel]
    var body: some View {
        List(users) { user in
            Text(user.name)
        }
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<UserModel>]) {
        _users = Query(filter: #Predicate<UserModel> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\UserModel.name)])
        .modelContainer(for: UserModel.self)
}
