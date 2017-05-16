//
//  Meme.swift
//  MemeMe
//
//  Created by Razlik, Yasin(AWF) on 06/04/17.
//  Copyright © 2017 Razlik, Yasin. All rights reserved.
//

import Foundation
import UIKit

class Meme {
    
    private var topText: String
    private var bottomText: String
    private var originalImage: UIImage
    private var memedImage: UIImage
    
    init(topText: String, bottomText: String, originalImage: UIImage, memedImage: UIImage) {
        self.topText = topText
        self.bottomText = bottomText
        self.originalImage = originalImage
        self.memedImage = memedImage
    }
    
    public func getMemedImage() -> UIImage {
        return memedImage
    }
}
