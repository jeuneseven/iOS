//
//  ViewController.swift
//  StormViewer
//
//  Created by seven on 2025/8/1.
//

import UIKit

class ViewController: UICollectionViewController {
    var pictures = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        DispatchQueue.global(qos: .userInitiated).async {
            [weak self] in
            let fm = FileManager.default
            let path = Bundle.main.resourcePath!
            var items = try! fm.contentsOfDirectory(atPath: path)
            
            items.sort(by: {
                $0 < $1
            })
            
            for item in items {
                if item.hasPrefix("nssl") {
                    self?.pictures.append(item)
                }
            }
            
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Picture", for: indexPath) as? PictureCell else { fatalError("Unable to dequeue PictureCell") }
        cell.name.text = pictures[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectImage = pictures[indexPath.row]
            vc.indexOfNumber = indexPath.row
            vc.count = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

