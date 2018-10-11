//
//  Sequence.swift
//  yojoy
//
//  Created by Denise Lutz on 25.09.18.
//  Copyright © 2018 Denise Lutz. All rights reserved.
//

import UIKit

struct Sequence {
    
    let chapter: String
    let subChapter: String
    
    init(chapter: String, subChapter: String) {
        self.chapter = chapter
        self.subChapter = subChapter
    }
}

struct Details {
    
    let title: String
    let description: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}
