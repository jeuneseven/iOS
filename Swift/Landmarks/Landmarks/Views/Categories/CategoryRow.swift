//
//  CategoryRow.swift
//  Landmarks
//
//  Created by seven on 2025/9/6.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)


            HStack(alignment: .top, spacing: 0) {
                ForEach(items) { landmark in
                    Text(landmark.name)
                }
            }
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return CategoryRow(
        categoryName: landmarks[0].category.rawValue,
        items: Array(landmarks.prefix(3))
    )
}
