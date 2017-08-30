//
//  ShotDetailViewController.swift
//  Shots
//
//  Created by Rafael Zanin on 29/08/17.
//  Copyright © 2017 Rafael Zanin. All rights reserved.
//

import UIKit

class ShotDetailViewController: UIViewController, ShotsControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var shotDetailCollectionView: UICollectionView!
    var shot : Shot?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        getShot(shotId: (shot?.id)!)
        
    }
    
    func getShot(shotId : Int) {
        
        DispatchQueue.main.async {
            ShotsController.sharedInstance.delegate = self
            ShotsController.sharedInstance.getShot(shotId: shotId)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerNibs(){
        self.shotDetailCollectionView.register(UINib.init(nibName: "ShotDetailCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "ShotDetailCollectionViewCell_ID")
        self.shotDetailCollectionView.delegate = self
        self.shotDetailCollectionView.dataSource = self
        self.shotDetailCollectionView.reloadData()
    }

    // MARK: - CollectionView delegate
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShotDetailCollectionViewCell_ID", for: indexPath) as! ShotDetailCollectionViewCell
        cell.setShot(shot: shot!)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let cell = self.shotDetailCollectionView.cellForItem(at: indexPath) as? ShotDetailCollectionViewCell
        var heightCell : CGFloat = collectionView.frame.size.height - 64
        
        if cell != nil {
            heightCell = (cell?.containerView.frame.size.height)!
        }
        
        let width: CGFloat = self.view.frame.size.width
        let height : CGFloat = heightCell
        
        return CGSize(width: width, height: height)
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
     // MARK: - Shot service delegate
    
    func getShotDidFinishWithSuccess(response: Shot) {
        shot = response
        self.shotDetailCollectionView.reloadData()
        self.shotDetailCollectionView.performBatchUpdates(nil, completion: nil)
    }
    
    func getShotDidFinishWithError(error: NSError?) {
        
    }

}
