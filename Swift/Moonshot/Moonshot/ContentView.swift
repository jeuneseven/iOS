//
//  ContentView.swift
//  Moonshot
//
//  Created by seven on 2025/7/15.
//

import SwiftUI

//struct CustomText: View {
//    var text:String
//    
//    var body: some View {
//        Text(text)
//    }
//    
//    init(_ text: String) {
//        print("a CustomText is created")
//        self.text = text
//    }
//}
//
//struct JSONObject: Codable {
//    var navigationBarTitleText: String
//    var usingComponents: UsingComponents
//}
//
//struct UsingComponents: Codable {
//    var i_icon: String
//}

struct ContentView: View {
//    let layout = [
//        GridItem(.fixed(50)),
//        GridItem(.fixed(50)),
//        GridItem(.fixed(50))
//    ]
    
//    let layout = [
//        GridItem(.adaptive(minimum: 50, maximum: 100))
//    ]
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                VStack {
                                    Text(mission.displayName)
                                            .font(.headline)
                                            .foregroundStyle(.white)
                                    Text(mission.formattedLaunchDate)
                                            .font(.caption)
                                            .foregroundStyle(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
        
//        Text(String(astronauts.count))
//        Text(String(missions.count))
//        
//        ScrollView(.horizontal) {
//            LazyHGrid(rows: layout) {
//                ForEach(0..<50) {
//                    Text("Item \($0)")
//                }
//            }
//        }
//
//        ScrollView(.horizontal) {
//            LazyHGrid(rows: layout) {
//                ForEach(0..<50) {
//                    Text("Item \($0)")
//                }
//            }
//        }
//        ScrollView(.vertical) {
//            LazyVGrid(columns: layout) {
//                ForEach(0..<50) {
//                    Text("Item \($0)")
//                }
//            }
//        }
//        
//        Button("Decode JSON") {
//            let input = """
//            {
//              "navigationBarTitleText": "title",
//              "usingComponents":{
//                "i_icon":"/iview/icon/index"
//              }
//            }
//            """
//            let data = Data(input.utf8)
//            let decoder = JSONDecoder()
//            if let object = try? decoder.decode(JSONObject.self, from: data) {
//                // /iview/icon/index
//                print(object.usingComponents.i_icon)
//            }
//        }
//        
//        NavigationStack {
//            List(0..<10) { row in
//                // NavigationLink can make sure the gray arrow in order to push to another view
////                NavigationLink("Row \(row)") {
////                    Text("Detail \(row)")
////                }
//                NavigationLink {
//                    Text("Detail \(row)")
//                } label: {
//                    Text("Row \(row)")
//                }
//            }
//            .navigationTitle("SwiftUI")
//        }
        
//        NavigationStack {
//            NavigationLink {
//                Text("Detail View")
//                    .navigationTitle("Detail View")
//            } label: {
//                VStack {
//                    Text("Tap me")
//                }
//            }
//            .navigationTitle("SwiftUI")
//        }
//        
//        ScrollView(.horizontal) { // make sure horizontal -> LazyHStack
//            // LazyHStack can improve efficient
//            LazyHStack(spacing: 10) {
//                ForEach(0..<100) {
//                    CustomText("Item \($0)")
//                }
//            }
//            // make scrollview can be scrolled through more area
//            .frame(maxWidth: .infinity)
//        }
        
//        ScrollView {
//            VStack(spacing: 10) {
//                ForEach(0..<100) {
//                    Text("Row \($0)")
//                        .font(.largeTitle)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
        
//        Image("Example")
//        GeometryReader { geo in
//            Image(.example)
//                .resizable()
//                        .scaledToFit()
//            //            .scaledToFill()
//                .frame(width: geo.size.width * 0.8)
//                .frame(width: geo.size.width, height: geo.size.height)
//            //            .containerRelativeFrame(.horizontal) { size, axis in
//            //                size * 0.8
//            //            }
//            //            .clipped()
//        }
    }
}

#Preview {
    ContentView()
}
