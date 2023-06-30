//
//  AllArticlesModel.swift
//  Etlas
//
//  Created by Hadir on 24/06/2023.
//

import UIKit

struct AllArticlesModel {
    
    let articleTitle: String
    let description: String
    let date: String
   // let imageURL: String
    let articleImg: UIImageView?
    
    init(
        articleTitle: String? = "Anubis",
        description: String? = "Know more about Anubis and his powers.",
        date: String? = "15 Jan 2023",
        //imageURL: String? = "nil"
        articleImg: UIImageView? = UIImageView(image: UIImage(named: "img_Anubis"))
        
    ) {
        self.articleTitle = articleTitle!
        self.description = description!
        self.date = date!
        self.articleImg = articleImg!
    }
    
}
