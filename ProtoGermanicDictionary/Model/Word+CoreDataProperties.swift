//
//  Word+CoreDataProperties.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 06/11/2024.
//
//

import Foundation
import CoreData


extension Word {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Word> {
        return NSFetchRequest<Word>(entityName: "Word")
    }

    @NSManaged public var fullTitle: String?
    @NSManaged public var id: UUID?
    @NSManaged public var sortTitle: String?
    @NSManaged public var title: String?
    @NSManaged public var wordType: String?
    @NSManaged public var nounGender: String?
    @NSManaged public var nounStem: String?
    @NSManaged public var translations: NSSet?

}

// MARK: Generated accessors for translations
extension Word {

    @objc(addTranslationsObject:)
    @NSManaged public func addToTranslations(_ value: Translation)

    @objc(removeTranslationsObject:)
    @NSManaged public func removeFromTranslations(_ value: Translation)

    @objc(addTranslations:)
    @NSManaged public func addToTranslations(_ values: NSSet)

    @objc(removeTranslations:)
    @NSManaged public func removeFromTranslations(_ values: NSSet)

}

extension Word : Identifiable {

}
