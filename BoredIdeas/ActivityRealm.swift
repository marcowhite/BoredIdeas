//
//  ActivityRealm.swift
//  BoredIdeas
//
//  Created by Елена Даниленко on 23.10.2023.
//

import Foundation
import RealmSwift

final class ActivityRealm: Object{
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var activity: String?
    @Persisted var activityId: String?
}

