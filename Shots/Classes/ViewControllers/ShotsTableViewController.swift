//
//  ShotsTableViewController.swift
//  Shots
//
//  Created by Rafael Zanin on 29/08/17.
//  Copyright © 2017 Rafael Zanin. All rights reserved.
//

import UIKit

class ShotsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ShotsControllerDelegate {

    var shotsList : NSMutableArray? = NSMutableArray()
    
    let SEGUE_DETAIL_ID = "SegueShotDetail_ID"
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib.init(nibName: "ShotTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ShotTableViewCell_ID")
        
        loadShots()
    }
    
    func loadShots() {
        ShotsController.sharedInstance.delegate = self
        ShotsController.sharedInstance.listShots()
    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (shotsList?.count)!
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShotTableViewCell_ID", for: indexPath) as! ShotTableViewCell
        let shot = shotsList?.object(at: indexPath.row) as! Shot
        cell.setShot(shot: shot)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          performSegue(withIdentifier: SEGUE_DETAIL_ID, sender: shotsList?.object(at: indexPath.row) as! Shot)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == SEGUE_DETAIL_ID) {
            let detailVC =  segue.destination as! ShotDetailViewController
            detailVC.shot = sender as? Shot
        }
    }
 
    // MARK: - Shot service delegate
    
    func listShotsDidFinishWithSuccess(response: NSMutableArray) {
        shotsList = response
        self.tableView.reloadData()
    }
    
    func listShotsDidFinishWithError(error: NSError?) {
        shotsList = NSMutableArray()
    }

}
