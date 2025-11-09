//
//  ContentView.swift
//  TheElements
//
//  Created by seven on 2025/9/10.
//

import SwiftUI

struct ContentView: View {
    enum SortType: String {
        case name = "Name"
        case number = "Number"
        case symbol = "Symbol"
        case state = "State"
    }
    
    let sortType: SortType
    
    var title: String {
        switch sortType {
        case .name:
            SortType.name.rawValue
        case .number:
            SortType.number.rawValue
        case .symbol:
            SortType.symbol.rawValue
        case .state:
            SortType.state.rawValue
        }
    }
    
    
    let elementsList: [ElementModel] = Bundle.main.decode("Elements.plist")
    
    var currentDataSource: [ElementModel] {
        switch sortType {
        case .name:
            elementsList.sorted(by: { element1, element2 in
                element1.name < element2.name
            })
        case .number:
            elementsList.sorted(by: { element1, element2 in
                element1.atomicNumber < element2.atomicNumber
            })
        case .symbol:
            elementsList.sorted(by: { element1, element2 in
                element1.symbol < element2.symbol
            })
        case .state:
            elementsList.sorted(by: { element1, element2 in
                element1.state < element2.state
            })
        }
    }
    
    let letters = (65...90).map { String(UnicodeScalar($0)!) }
    
    var indexElementsList: [String: [ElementModel]] { Dictionary(grouping: elementsList) { element in
            String(element.symbol.prefix(1).uppercased())
        }
    }
    
    var groupElementsList: [String: [ElementModel]] {
        Dictionary(grouping: elementsList) { element in
            String(element.state.uppercased())
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(currentDataSource, id: \.atomicNumber) { element in
                    NavigationLink {
                        DetailsView(element: element)
                    } label: {
                        HStack {
                            Image(systemName: "square")
                            Text(element.name)
                                .font(.title)
                        }
                    }
                }
            }
            .navigationTitle(title)
        }
    }
}

#Preview {
    ContentView(sortType: .name)
}
