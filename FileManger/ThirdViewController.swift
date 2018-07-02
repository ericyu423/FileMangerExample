//
//  ThirdViewController.swift
//  FileManager
//
//  Created by eric yu on 11/5/17.
//  Copyright © 2017 eric yu. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = FileManager.default
        let document = manager.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = document.first!
        let fileURL = docURL.appendingPathComponent("sentances.dat")
        let filePath = fileURL.path
        
        if manager.fileExists(atPath: filePath){
            if let content = manager.contents(atPath: filePath){
                let result = NSKeyedUnarchiver.unarchiveObject(with: content) as! String
                print(result)
                
                label.text = result
            }
        }else{
            let quote = "Creating using arhivedDat(withRootObject: sentance here)"
            let fileData = NSKeyedArchiver.archivedData(withRootObject: quote)
            manager.createFile(atPath: filePath, contents: fileData, attributes: nil)
        }
        
        
        
        
        

    }

   
}
