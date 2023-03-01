//
//  Images.swift
//  ImageDownloder
//
//  Created by KimJaeYoun on 2023/03/01.
//

import Foundation

struct Images {
    var urls = [URL]()
    
    init(count: Int) {
        guard count != .zero else { return }
        var photoNumber = 100
        
        for _ in 1...count {
            guard let url = URL(string: "https://picsum.photos/id/\(photoNumber)/150/150") else {
                return
            }
            
            urls.append(url)
            photoNumber += 100
        }
    }
}
