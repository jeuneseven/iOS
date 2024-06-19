//
//  ContentView.swift
//  TodoList
//
//  Created by seven on 2024/6/16.
//

import SwiftUI

struct TableViewWrapper: UIViewControllerRepresentable {
    class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate {
        var parent: TableViewWrapper

        init(parent: TableViewWrapper) {
            self.parent = parent
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return parent.items.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = parent.items[indexPath.row]
            return cell
        }
    }

    var items: [String]

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UITableViewController {
        let tableViewController = UITableViewController()
        tableViewController.tableView.dataSource = context.coordinator
        tableViewController.tableView.delegate = context.coordinator
        tableViewController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableViewController
    }

    func updateUIViewController(_ uiViewController: UITableViewController, context: Context) {
        uiViewController.tableView.reloadData()
    }
}

struct ContentView: View {
    var body: some View {
        TableViewWrapper(items: ["Item 1", "Item 2", "Item 3", "Item 4"])
            .navigationBarTitle("UITableView Example", displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//#Preview {
//    ContentView()
//}
