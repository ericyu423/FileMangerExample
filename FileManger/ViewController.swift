//
//  ViewController.swift
//  FileManger
//
//  Created by eric yu on 11/4/17.
//  Copyright © 2017 eric yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate {
    
    @IBOutlet weak var dailyTask: UITextView!
   
    var pathAndText: (String,URL)!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dailyTask.delegate = self
        pathAndText = prepareFileManger(fileName: "myPlan.txt",text: "")
        dailyTask.text = pathAndText.0
        
        
      
    }
    func textViewDidChange(_ textView: UITextView) {
        
        
        if let text = dailyTask.text {
            
            
            writeToFileWith(fileURL: pathAndText.1, text: text)
        }
        
    }
    
   func writeToFileWith(fileURL: URL,text: String){
        do{
            try text.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            print("error")
        }
    }
    
    func prepareFileManger(fileName: String,text: String) -> (String,URL){
        //get userDirectory path
        let manager = FileManager.default
        let document = manager.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = document.first!
        
        //read return file content or create blank file
        let fileURL = docURL.appendingPathComponent(fileName)
        
        if manager.fileExists(atPath: fileURL.path) {
            if let content = manager.contents(atPath: fileURL.path),let text = String(data: content, encoding: .utf8){
                
                return (text,fileURL)
            }else {
                 manager.createFile(atPath: fileURL.path, contents: nil, attributes: nil)
            }
        }
             return ("",fileURL)
    }
        
   
}


