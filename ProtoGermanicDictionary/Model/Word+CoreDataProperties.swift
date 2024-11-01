//
//  Word+CoreDataProperties.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 01/11/2024.
//
//

import Foundation
import CoreData


extension Word {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Word> {
        return NSFetchRequest<Word>(entityName: "Word")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?

}

extension Word : Identifiable {

}
