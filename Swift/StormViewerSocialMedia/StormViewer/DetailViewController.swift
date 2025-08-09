//
//  DetailViewController.swift
//  StormViewer
//
//  Created by seven on 2025/8/1.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var selectImage: String?
    var indexOfNumber: Int?
    var count: Int?
    var shownTimes: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shownTimes = UserDefaults.standard.integer(forKey: selectImage ?? "")
//        title = selectImage ?? "View Picture"
        title = "Picture \(indexOfNumber! + 1) of \(count!) shown \(shownTimes ?? 0) times"
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

        if let imageToload = selectImage {
            imageView.image = UIImage(named: imageToload)
            shownTimes! += 1
            UserDefaults.standard.set(shownTimes, forKey: imageToload)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else { print("no image found"); return}
        
        guard let imageName = selectImage else { return }
        
        let vc = UIActivityViewController(activityItems: [image, imageName], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
