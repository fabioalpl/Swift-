//
//  HorizontalFlowLayout.swift
//  final_project


import Foundation
import UIKit

class HorizontalFlowLayout: UICollectionViewFlowLayout {
    
    override init(){
        super.init()
        scrollDirection = .horizontal
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        scrollDirection = .horizontal
    }
}
