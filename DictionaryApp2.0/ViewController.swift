//
//  ViewController.swift
//  DictionaryApp2.0
//
//  Created by Matt Fuller on 1/21/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
	
	var word: Word?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		//	This code sets the name in ViewController to display data from the item property if 	it's non-nil.
		//	This only happens when editing an existing item.
		if let word = word {
			fullWordLabel.text = word.name
		}
		
	}
	
	@IBOutlet weak var newWordTextField: UITextField!
	@IBOutlet weak var newDefinitionTextField: UITextField!
	@IBOutlet weak var fullWordLabel: UILabel!
	@IBOutlet weak var saveButton: UIBarButtonItem!
	
	//	This creates a Boolean value that indicates whether the view controller presenting this scene is of type UINavigationController.
	//	As indicated by the constant name isInAddMode, this means that the Add button was used to present the scene.
	@IBAction func cancel(_ sender: UIBarButtonItem) {
		let isInAddMode = presentingViewController is UINavigationController
		
		if isInAddMode {
			dismiss(animated: true, completion: nil)
		}
		else {
			navigationController!.popViewController(animated: true)
		}
	}
	
	@IBAction func addNewWordButton(_ sender: UIButton) {
		
		
		let word = newWordTextField.text
		let def = newDefinitionTextField.text
		
		let fullWord = "\(word!) - \(def!)."
		
		fullWordLabel.text = fullWord
		
		print()
		print(fullWord)
		
		
	}
	
	//
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if sender as AnyObject? === saveButton {
			if (word?.name == nil) {
				let nameWord = newWordTextField.text ?? ""
				print("nameWord = \(nameWord)")
				
				let nameDef = newDefinitionTextField.text ?? ""
				print("nameDef = \(nameDef)")
				
				let fullWord = "\(nameWord) - \(nameDef)."
				word = Word(name: fullWord)
			} else {
				//			let nameWord = newWordTextField.text ?? ""
				//			print("nameWord = \(nameWord)")
				//
				//			let nameDef = newDefinitionTextField.text ?? ""
				//			print("nameDef = \(nameDef)")
				//
				//			let fullWord = "\(nameWord) - \(nameDef)."
				//			word = Word(name: fullWord)
			}
		}
	}
	
	//	var words = [Int: String?]() // initializes a Dictionary
	var words: [Int: String?] = [0: "Ambiguous- open to more than one interpretation; more than one meaning.",
								 1: "Arbitrary- based on random choice or personal whim, rather than any reasoor system.",
								 2: "Discretionary- available for use at the leisure of the user.",
								 3: "Navigation Controller- manages the transitions backward and forward through a series of view controllers.",
								 4: "Navigation Stack- the set of view controllers managed by a particular navigation controller.",
								 5: "Segues- the transitions between app scenes.",
								 6: "Root View Controller- the first item added to a navigation controller's navigation stack, which is never removed from the stack.",
								 7: "Outlets- offer a way to reference the interface objects that I added to the Storyboard.",
								 8: "Actions- executes a piece of code when selected. (ex. A button)",
								 9: "Opaque- not able to see be seen through; not transparent.",
								 10: "UITextFieldDelegate- a set of optional methods that you use to manage the editing and validation of text in a text field object."] // initializes a Dictionary
	
	
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
		
	}
	
	
}

