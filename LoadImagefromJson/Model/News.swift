//
//  News.swift
//  LoadImagefromJson
//
//  Created by Claudio Tendean on 24/05/23.
//

import Foundation

struct News : Identifiable {
    var id = UUID()
    var title : String
    var image : String
    var description : String
}
