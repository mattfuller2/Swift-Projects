//
//  ViewController.swift
//  ToDo App
//
//  Created by Matt Fuller on 12/22/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import Foundation

var pageNum = 0
var item: Item?
var tableView: UITableView?

class ViewController: UIViewController, UITextFieldDelegate {
	
	
	// Stores a pointer to nameTextField and configures the storyboard to set up that connection.
	// "weak" means it's possible for the property to have no value.
	@IBOutlet weak var nameTextField: UITextField!
	
	@IBOutlet weak var nameLabel: UILabel!
	
	@IBAction func saveButton(_ sender: UIBarButtonItem) {
		loadView()
	}
	
	

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//		if case let sender as! AnyObject? === saveButton (UIBarButtonItem) -> ()  {
//			let text = self.nameTextField.text ?? ""
//			item = Item(name: text)
//		}
		
		
		
		if let value = sender
		{
			print(value)
			
		}
			
		else
		{
			print("No")
		}
		
	}
	
	@IBAction func cancel(_ sender: UIBarButtonItem) {
		dismiss(animated: true, completion: nil)
	}
	
	@IBAction func unwindToList(sender: UIStoryboardSegue) {
		let srcViewCon = sender.source as? ViewController
		_ = srcViewCon
		
		if  (srcViewCon != nil && item?.name != "") {
			// Add a new word
			let newIndexPath = IndexPath(row: srcViewCon.hashValue, section: 0)
//			item.append(word!)
			tableView!.insertRows(at: [newIndexPath], with: .bottom)
		}
	}

	@IBAction func addNewWord(_ sender: UIBarButtonItem) {
	}
	
	@IBSegueAction func Instanstiation(_ coder: NSCoder, sender: Any?) -> UINavigationController? {
	

	
		func loadView() {
		
	
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		pageNum += 1
		
		self.title = "Page\(pageNum)"
		self.view.backgroundColor = UIColor.systemRed
		
		let push = UIButton(frame: CGRect(x: 90, y: 120, width: 240, height: 40))
//			push.setTitle("New Word", for: ACTION.UIViewController)
		push.backgroundColor = UIColor.blue
		push.addTarget(self, action: #selector(ViewController.saveButton(_:)), for: UIControl.Event.touchUpInside)
	}
		return navigationController
	}
	
	// determines if the save button was tapped and creates the appropriate word object.
	fileprivate func extractedFunc() {
		var text: String? {
			get{
				return "\nameTextField ?? default value)"
		}
		set{
		}

			
		}
	}
	
	
}



