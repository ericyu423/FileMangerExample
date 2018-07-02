//
//  Book.swift
//  FileManager
//
//  Created by eric yu on 11/5/17.
//  Copyright © 2017 eric yu. All rights reserved.
//

import UIKit
class Book: NSObject, NSCoding {
    
    
    var title: String?
    var author: String?
    var edition: Int?
    
    init(btitle: String, bauthor: String, bedition:Int){
        title = btitle
        author = bauthor
        edition = bedition
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(author, forKey: "author")

        //problem with saving stuff in Int whatever taking me too much time
        //saving as anyobject and coverted back is the same
        aCoder.encode(edition!, forKey: "edition")
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        title =   aDecoder.decodeObject(forKey: "title") as? String
        author =  aDecoder.decodeObject(forKey: "author") as? String
        edition = aDecoder.decodeObject(forKey: "edition") as? Int
    }
}
