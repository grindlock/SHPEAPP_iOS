//
//  HomeVC.swift
//  shpe_test
//
//  Created by Sergio Perez-Aponte on 2/26/17.
//  Copyright © 2017 Sergio Perez-Aponte. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class NewsFeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        DataService.ds.REF_POSTS.observe(.value, with: { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot]{
                for snap in snapshot{
                    print("SNAP:  \(snap)")
                    if let postDic = snap.value as? Dictionary<String, AnyObject>{
                       let key = snap.key
                       let post = Post(postKey: key, postData: postDic)
                       self.posts.append(post)
                    }
                }
            }
            self.tableView.reloadData()
        })
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 296
        
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedCell {
            cell.confifigureCell(post: post)
            return cell
        }
        else{
            return FeedCell()
        }
    }
    
    @IBAction func logOut(_ sender: Any) {
    
        if FIRAuth.auth()?.currentUser != nil {
            
            KeychainWrapper.standard.removeObject(forKey: KEY_UID)
            do{
                try FIRAuth.auth()?.signOut()
                let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainVC")
                present(mainVC, animated: true, completion: nil)
                
            }catch let error as NSError{
                print(error.localizedDescription)
            }
        }
    }
  
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
