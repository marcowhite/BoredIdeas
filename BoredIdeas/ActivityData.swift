//
//  ActivityData.swift
//  BoredIdeas
//
//  Created by Елена Даниленко on 22.10.2023.
//

import Foundation
import RealmSwift

final class ActivityData: Object{
    @Persisted var id: String = UUID().uuidString
    @Persisted var activity: String = ""
    @Persisted var activityId: Int = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
