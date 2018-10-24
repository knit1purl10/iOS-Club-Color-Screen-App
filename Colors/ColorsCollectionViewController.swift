//
//  CollectionViewController.swift
//  Colors
//
//  Created by Olivia Hon on 10/23/18.
//  Copyright © 2018 Olivia Hon. All rights reserved.
//

import UIKit

class ColorsCollectionViewController: UICollectionViewController {
    
    var colors : [UIColor] = []
    
    private let reuseIdentifier = "ColorCell"
    private let contentSpacing: CGFloat = 12.0
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        self.collectionView!.delegate = self
        // Do any additional setup after loading the view.
        
        self.colors = [UIColor.blue,UIColor.red, UIColor.green, UIColor.yellow]
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.colors.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
        cell.backgroundColor = self.colors[indexPath.row]
        cell.layer.cornerRadius = 10.0
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ColorDetail", sender: indexPath)
    }
    
    
         // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? ColorDetailViewController {
            let indexPath: IndexPath?
            if let cell = sender as? UICollectionViewCell {
                indexPath = self.collectionView!.indexPath(for: cell)
            } else {
                indexPath = sender as? IndexPath
            }
            
            if let indexPath = indexPath {
                detailVC.color = self.colors[indexPath.row]
            }
        }
    }
    
    @IBAction private func createColorPressed(_ sender: Any?) {
        ColorPickerViewController.present(over: self) { color in
            if let color = color {
                self.colors.append(color)
                self.collectionView!.reloadData()
            }
            self.presentedViewController?.dismiss(animated: true, completion: nil)
        }
    }
}

extension ColorsCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    //MARK: -UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let sectionInset = self.collectionView(collectionView, layout: collectionView.collectionViewLayout, insetForSectionAt: 0)
        //var availableBounds = UIEdgeInsetsInsetRect(collectionView.bounds, sectionInset)
        var availableBounds = collectionView.bounds.inset(by: sectionInset)
        availableBounds = availableBounds.inset(by: collectionView.safeAreaInsets)
        
        let cellWidth = (availableBounds.width - self.contentSpacing) / 2.0
        let cellHeight = cellWidth
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.contentSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return self.contentSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: contentSpacing, left: contentSpacing, bottom: contentSpacing, right: contentSpacing)
    }
    
    
}
