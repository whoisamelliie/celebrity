//
//  Celebrity.swift
//  celebrityAPI
//
//  Created by Amelie Baimukanova on 26.02.2024.
//

import Foundation
import SwiftyJSON


struct Celebrity {
    var name = ""
    var nationality = ""
    var gender = ""
    
    init(json: JSON) {
        name = json["name"].stringValue
        nationality = json["nationality"].stringValue
        gender = json["gender"].stringValue
    }
}
