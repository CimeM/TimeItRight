//
//  style.swift
//  Time it right!
//
//  Created by Martin Cimerman on 16/05/16.
//  Copyright © 2016 Martin Cimerman. All rights reserved.
//

import Foundation
import Swift
import UIKit
// buttons



class TINavButton : UIButton  {
    
    required init?(coder aDecoder : NSCoder){
            super.init(coder:aDecoder)
            self.layer.borderColor = UIColor.whiteColor().CGColor
            self.layer.cornerRadius = 10
            self.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
            self.layer.borderWidth = 2
            self.frame.size.width = 300
            self.frame.size.height = 50
    }
    
}

class TITimeButton : UIButton  {
    
    required init?(coder aDecoder : NSCoder){
        super.init(coder:aDecoder)
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.cornerRadius = 10
        self.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        self.layer.borderWidth = 2
    }
    
}

class TIviewController : UIView {
    required init?(coder aDecoder : NSCoder) {
        super.init(coder:aDecoder)
        self.backgroundColor = UIColor(red: 33/255, green: 99/255, blue: 255/255, alpha: 1)
    }
}