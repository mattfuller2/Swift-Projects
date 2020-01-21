//
//  Word.swift
//  DictionaryApp2.0
//
//  Created by Matt Fuller on 1/21/20.
//

import Foundation

class Word: NSObject, NSCoding {
	
	// The encodeWithCoder() method prepares the class's information to be archived.
	func encode(with aCoder: NSCoder) {
		aCoder.encode(name, forKey: "name")
		print("Name encode = \(name)")
		
	}
	
	// The initializer unarchives the data when the class is created.
	required convenience init?(coder aDecoder: NSCoder) {
		let name = aDecoder.decodeObject(forKey: "name") as! String
		self.init(name: name)
		print("Name inititializer = \(name)")
	}
	
	var name: String
	
	init?(name: String) {
		self.name = name
		super.init()
		print("String name: \(name)")
	}
	
	// Creates a persistent path on the file system, where data will be saved and loaded.
	static let Dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
	
	static let ArchiveURL = Dir.appendingPathComponent("words")
	
	
}
