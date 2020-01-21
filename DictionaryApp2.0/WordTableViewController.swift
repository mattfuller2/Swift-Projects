//
//  WordTableViewController.swift
//  DictionaryApp2.0
//
//  Created by Matt Fuller on 1/21/20.
//

import Foundation
import UIKit

class WordTableViewController: UITableViewController {
	
	var words = [Int: String?]() // initializes a Dictionary
	
	@IBOutlet weak var nameLabel: UILabel!
	
	
	// This code determines whether a row in the table view is selected.
	// If it is, that means a user tapped one of the table view cells to edit an item.
	// In other words, this if statement gets executed when an existing item is being edited.
	@IBAction func unwindToList(sender: UIStoryboardSegue) {
		let srcViewCon = sender.source as? ViewController
		let word = srcViewCon?.word
		if (srcViewCon != nil && word?.name != "") {
			if let selectedIndexPath = tableView.indexPathForSelectedRow {
				// Update an existing meal.
				words[selectedIndexPath.row] = word?.name
				tableView.reloadRows(at: [selectedIndexPath], with: .none)
			}
			else {
				// Add a new meal.
				let newIndexPath = NSIndexPath(row: words.count, section: 0)
				words.updateValue(word?.name, forKey: words.count)
				tableView.insertRows(at: [newIndexPath as IndexPath], with: .bottom)
			}
			saveWords()
		}
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		loadSampleWords()
		
		// Displays an Edit button in the navigation bar for this view controller.
		self.navigationItem.leftBarButtonItem = self.editButtonItem
		
		// Load saved words
		if let savedWords = loadWords() {
			words = savedWords
		}
		
		//        // Uncomment the following line to preserve selection between presentations
		//         self.clearsSelectionOnViewWillAppear = false
		
	}
	
	func loadSampleWords() {
		words = [0: "Ambiguous- open to more than one interpretation; more than one meaning.",
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
		
		print("Words: \(words)")
	}
	
	// This method attempts to unarchive the object stored at the path Word.ArchiveURL and to downcast that object to an array of Word objects.
	func loadWords() -> [Int: String]? {
		
		return NSKeyedUnarchiver.unarchiveObject(
			withFile: Word.ArchiveURL.path) as? [Int: String]
	}
	
	
	// MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		print("Number of rows: \(words.count)")
		print()
		
		return words.count
	}
	
	// Adds the words dictionary to the table view.
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier:  "WordTableViewCell", for: indexPath) as UITableViewCell
		
		// IMPORTANT:
		// Configure the cell...
		let word: String?? = words[indexPath.row]
		if word == nil {
			cell.textLabel?.text = words[words.count] as? String
			
			print("Table View Cell1 = \(cell)")
			print("Cell textLabel1 = \(String(describing: cell.textLabel!.text))")
			print()
		}
		else {
			//			cell.textLabel?.text = words[words.count] as? String
			cell.textLabel?.text = word!
			
			//		print("Table View Cell2 = \(cell)")
			//		print("Cell textLabel2 = \(String(describing: cell.textLabel!.text))")
			//		print()
			
		}
		return cell
	}
	
	// The code passes the value of the clicked cell to the ViewController.
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ShowDetail" {
			let detailVC = segue.destination as! ViewController
			print()
			print("DetailedVC = \(String(describing: detailVC))")
			
			// Get the cell that generated this segue.
			if let selectedCell = sender as? UITableViewCell {
				let indexPath = tableView.indexPath(for: selectedCell)!
				print("indexPath = \(indexPath)")
				
				let selectedWord = words[indexPath.row]
				print("selectedWord = \(selectedWord!!)")
				
				detailVC.word = Word.init(name: selectedWord!!)
				print("DetailedVC = \(detailVC.word!)")
				print()
				
			}
		}
		else if segue.identifier == "AddNewWord" {
			//			print("Add New Word Identifier")
		}
	}
	
	/*
	// Override to support conditional editing of the table view.
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
	// Return false if you do not want the specified item to be editable.
	return true
	}
	*/
	
	
	// Override to support editing the table view.
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			// Delete the row from the data source
			words.removeValue(forKey: indexPath.row)
			saveWords()
			tableView.deleteRows(at: [indexPath], with: .right)
			
			print("The value \(String(describing: words[indexPath.row])) was removed")
			print(words)
		} else if editingStyle == .insert {
			// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
		}
	}
	
	// Saves and loads the words list whenever a user adds, edits, or removes a word.
	func saveWords() {
		let isSaved = NSKeyedArchiver.archiveRootObject(words, toFile: Word.ArchiveURL.path)
		if !isSaved {
			print("Failed to save words...")
		}
	}
	
	
	/*
	// Override to support rearranging the table view.
	override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
	
	}
	*/
	
	/*
	// Override to support conditional rearranging of the table view.
	override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
	// Return false if you do not want the item to be re-orderable.
	return true
	}
	*/
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	// Get the new view controller using segue.destination.
	// Pass the selected object to the new view controller.
	}
	*/
	
}
