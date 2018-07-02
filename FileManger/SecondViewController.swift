//
//  SecondViewController.swift
//  FileManager
//
//  Created by eric yu on 11/5/17.
//  Copyright © 2017 eric yu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBAction func LoadFile(_ sender: UIButton) {
            getBundleFile()
    }
    @IBOutlet weak var fileTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    //this should be in didFinsihLuachingWithOption
    
    func getBundleFile(){
        //get file pathfrom bundle (FileManager bundle)
        let filePath = Bundle.main.path(forResource: "mySpeicalFile", ofType: "txt")
        let manager = FileManager.default
        if let filePath = filePath,let data = manager.contents(atPath: filePath){
            let message = String(data: data, encoding: .utf8)
            fileTextView.text = message
        }else{
            print("file not found")
        }
    }
}
