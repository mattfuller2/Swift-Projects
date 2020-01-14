//
//  WordTableViewCell.swift
//  ToDo App
//
//	This creates a class for our cells, inherited from the UITableViewCell class. We can now configure the words in the table.
//
//  Created by Matt Fuller on 12/22/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class WordTableViewCell: UITableViewCell {

	@IBAction func terms(_ sender: UIBarButtonItem) {
//		setSelected(false, animated: true)
	}
	@IBOutlet weak var word1: UILabel!
	
	@IBOutlet weak var nameLabel: UITableViewCell!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//		type(of: , init)?(WithCoder: NSCoding)
	
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

		print("WEAK word1: \(word1.text!)")
        // Configure the view for the selected state
    }

}
