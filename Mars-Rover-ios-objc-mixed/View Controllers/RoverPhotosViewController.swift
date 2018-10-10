//
//  RoverPhotosViewController.swift
//  Mars-Rover-ios-objc-mixed
//
//  Created by Conner on 10/9/18.
//  Copyright © 2018 Conner. All rights reserved.
//

import UIKit

class RoverPhotosViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
        client.fetchRoverPhotos(withRover: "curiosity", sol: 1) { (roverPhotos, error) in
            self.roverPhotos = roverPhotos
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.roverPhotos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as?
            CGARoverPhotoCollectionViewCell ?? CGARoverPhotoCollectionViewCell()
        
        loadImage(forCell: cell, forItemAt: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        var totalUsableWidth = collectionView.frame.width
        let inset = self.collectionView(collectionView, layout: collectionViewLayout, insetForSectionAt: indexPath.section)
        totalUsableWidth -= inset.left + inset.right
        
        let minWidth: CGFloat = 150.0
        let numberOfItemsInOneRow = Int(totalUsableWidth / minWidth)
        totalUsableWidth -= CGFloat(numberOfItemsInOneRow - 1) * flowLayout.minimumInteritemSpacing
        let width = totalUsableWidth / CGFloat(numberOfItemsInOneRow)
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10.0, bottom: 0, right: 10.0)
    }
    
    private func loadImage(forCell cell:CGARoverPhotoCollectionViewCell, forItemAt indexPath: IndexPath) {
        let imageURL = self.roverPhotos[indexPath.row].imageURL
        let url = URL(string: imageURL)!
        
        // using the imageURL, add https
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return }
        components.scheme = "https"
        
        do {
            let  data = try Data(contentsOf: components.url!)
            let image = UIImage(data: data)
            cell.marsRoverPhotoImageView.image = image
        } catch {
            NSLog("Error getting photo for item: \(indexPath)")
        }
    }
    
    private var roverPhotos: [MarsPhoto] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    private let client = MarsRoverClient()
    @IBOutlet var collectionView: UICollectionView!
}
