//
//  FeedCell.swift
//  shpe_test
//
//  Created by Sergio Perez-Aponte on 3/17/17.
//  Copyright © 2017 Sergio Perez-Aponte. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameLbl:UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var postText: UILabel!
    //@IBOutlet weak var likes: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        /*if(postImg.image == nil){
            postImg.sizeToFit() }*/
    }

    /*override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }*/

}
