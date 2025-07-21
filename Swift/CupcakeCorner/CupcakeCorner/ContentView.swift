//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by seven on 2025/7/19.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

@Observable
class User: Codable {
//    enum CodingKeys: String, CodingKey {
//            case _name = "name"
//    }
    
    var name = "Taylor"
}

struct ContentView: View {
    @State private var counter = 0
    
//    @State private var results = [Result]()
//    @State private var username = ""
//    @State private var email = ""
    
//    var disableForm: Bool {
//        username.count < 5 || email.count < 5
//    }
//    
//    func encodeTaylor() {
//        let data = try! JSONEncoder().encode(User())
//        let str = String(decoding: data, as: UTF8.self)
//        print(str)
//    }
    
    var body: some View {
        Button("Tap count: \(counter)") {
            counter += 1
        }
        .sensoryFeedback(.increase, trigger: counter)
        
//        Button("Encode Taylor", action: encodeTaylor)
//        Form {
//            Section {
//                TextField("Username", text: $username)
//                TextField("Email", text: $email)
//            }
//
//            Section {
//                Button("Create account") {
//                    print("Creating account…")
//                }
//            }
//            .disabled(disableForm)
////            .disabled(username.isEmpty || email.isEmpty)
//        }
        
//        AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
//            if let image = phase.image {
//                image
//                    .resizable()
//                    .scaledToFit()
//            } else if phase.error != nil {
//                Text("There was an error loading the image.")
//            } else {
//                ProgressView()
//            }
//        }
//        .frame(width: 200, height: 200)
        
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
//            image
//                .resizable()
//                .scaledToFit()
//        } placeholder: {
////            Color.red
//            ProgressView()
//        }
//        .frame(width: 200, height: 200)
        
//        List(results, id: \.trackId) { item in
//            VStack(alignment: .leading) {
//                Text(item.trackName)
//                    .font(.headline)
//                Text(item.collectionName)
//            }
//        }
//        .task {
//            await loadData()
//        }
    }
    
//    func loadData() async {
//        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
//            print("Invalid URL")
//            return
//        }
//        
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//
//            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
//                results = decodedResponse.results
//            }
//        } catch {
//            print("Invalid data")
//        }
//    }
}

#Preview {
    ContentView()
}
