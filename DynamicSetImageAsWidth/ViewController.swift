//
//  ViewController.swift
//  DynamicSetImageAsWidth
//
//  Created by Appinventiv Technologies on 02/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    private let leftAndRightPadding:CGFloat = 32.0
    private let numberOfItemPerRow : CGFloat = 3.0
    private let heightAdjustment: CGFloat = 30.0
    
    var arr = [String]()
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self
        
      arr = ["macbook","macbook-pro-13","macbook-pro-retina","macbook-air","imac-5k","mac-pro","mac-mini","display","airport-extreme","os-x","ilife","iwork", "logic-pro-x","final-cut-pro-x","aperture","ipod-nano","ipod-shuffle","ipod-touch","itunes","apple-tv","icloud","apple Pay"]
        
        let width = ((collectionViewOutlet!.frame.width) - leftAndRightPadding) / numberOfItemPerRow
        
       let layout = collectionViewOutlet.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width:width, height: (width + heightAdjustment))

    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCell
        cell.imageOutlet.image = UIImage(named: arr[indexPath.row])
        return cell
    }

}



