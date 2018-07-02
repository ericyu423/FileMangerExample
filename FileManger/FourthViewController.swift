//
//  FourthViewController.swift
//  FileManager
//
//  Created by eric yu on 11/5/17.
//  Copyright © 2017 eric yu. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    
    
    @IBOutlet weak var textfield1: UITextField!
    
    @IBOutlet weak var textfield2: UITextField!
    
    @IBOutlet weak var textfield3: UITextField!
    
    var book: Book!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //this is bad programming but I dont' want to spent time fixing it
        //just want to see how this works
    
        let manager = FileManager.default
        let document = manager.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = document.first!
        let fileURL = docURL.appendingPathComponent("book.dat")
        let filePath = fileURL.path
        if manager.fileExists(atPath: filePath){
            if let content = manager.contents(atPath: filePath){
                book = NSKeyedUnarchiver.unarchiveObject(with: content) as? Book
                
            }
        }
        
        if (book != nil){
        label1.text = book.title
        label2.text = book.author
        label3.text = "\(book.edition)"
        }
        
        
    }

    @IBAction func save(_ sender: UIButton) {
        let x = textfield1.text!
        let y = textfield2.text!
        let z = Int(textfield3.text!)
        
        let mybook = Book(btitle: x, bauthor: y, bedition: z!)
        
        
      saveBook(book: mybook)
    }
    

    
    
    func saveBook(book: Book){
        let manager = FileManager.default
        let document = manager.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = document.first!
        let fileURL = docURL.appendingPathComponent("book.dat")
        let filePath = fileURL.path
      
            
            let fileData = NSKeyedArchiver.archivedData(withRootObject: book)
            manager.createFile(atPath: filePath, contents: fileData, attributes: nil)
   
        
       
    }
    


}
