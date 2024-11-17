//
//  Test.swift
//  ProtoGermanicDictionaryTests
//
//  Created by Andrey Skurlatov on 06/11/2024.
//

import XCTest
@testable import ProtoGermanicDictionary

class VerbClassTests: XCTestCase {
    
    func testStrongVerbClassDetection() {
        XCTAssertEqual(VerbClass.detectVerbClass(isStrong: true, verbClass: "1"), .strongClass1)
        XCTAssertEqual(VerbClass.detectVerbClass(isStrong: true, verbClass: "2"), .strongClass2)
        XCTAssertEqual(VerbClass.detectVerbClass(isStrong: true, verbClass: "3"), .strongClass3)
        XCTAssertEqual(VerbClass.detectVerbClass(isStrong: true, verbClass: "4"), .strongClass4)
        XCTAssertEqual(VerbClass.detectVerbClass(isStrong: true, verbClass: "5"), .strongClass5)
        XCTAssertEqual(VerbClass.detectVerbClass(isStrong: true, verbClass: "6"), .strongClass6)
        
        // Test for multiple strong class 7 variants
        XCTAssertEqual(VerbClass.detectVerbClass(isStrong: true, verbClass: "7"), .strongClass7)
        XCTAssertEqual(VerbClass.detectVerbClass(isStrong: true, verbClass: "7a"), .strongClass7)
        XCTAssertEqual(VerbClass.detectVerbClass(isStrong: true, verbClass: "7b"), .strongClass7)
        XCTAssertEqual(VerbClass.detectVerbClass(isStrong: true, verbClass: "7c"), .strongClass7)
        XCTAssertEqual(VerbClass.detectVerbClass(isStrong: true, verbClass: "7d"), .strongClass7)
        XCTAssertEqual(VerbClass.detectVerbClass(isStrong: true, verbClass: "7e"), .strongClass7)
    }
    
    func testWeakVerbClassDetection() {
        XCTAssertEqual(VerbClass.detectVerbClass(isStrong: false, verbClass: "wk1"), .weakClass1)
        XCTAssertEqual(VerbClass.detectVerbClass(isStrong: false, verbClass: "wk2"), .weakClass2)
        XCTAssertEqual(VerbClass.detectVerbClass(isStrong: false, verbClass: "wk3"), .weakClass3)
        XCTAssertEqual(VerbClass.detectVerbClass(isStrong: false, verbClass: "wk4"), .weakClass4)
    }
    
    func testIrregularAndUnknownClassDetection() {
        // Test for unknown cases
        XCTAssertEqual(VerbClass.detectVerbClass(isStrong: true, verbClass: "8"), .unknown)
        XCTAssertEqual(VerbClass.detectVerbClass(isStrong: false, verbClass: "wk5"), .unknown)
        XCTAssertEqual(VerbClass.detectVerbClass(isStrong: false, verbClass: "nonexistent"), .unknown)
    }
    
    
    func testStrongClass1VerbInflections() {
        let verbClass = VerbClass.strongClass1
        let word = "bīdaną" // Example Strong Class I verb
        
        // Present Indicative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .first, word: word), "bīdō")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .second, word: word), "bīdizi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .third, word: word), "bīdidi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .first, word: word), "bīdamaz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .second, word: word), "bīdid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .third, word: word), "bīdandi")

        // Past Indicative
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .first, word: word), "baid")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .second, word: word), "baidst")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .third, word: word), "baid")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .first, word: word), "bidum")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .second, word: word), "bidud")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .third, word: word), "bidun")
        
        // Present Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "bīdaų")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "bīdaiz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "bīdai")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "bīdaim")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "bīdaid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "bīdain")
        
        // Imperative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .singular, person: .second, word: word), "bīd")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .second, word: word), "bīdid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .third, word: word), "bīdandau")
    }
    
    func testStrongClass2VerbInflections() {
        let verbClass = VerbClass.strongClass2
        let word = "kleubaną" // Example Strong Class II verb

        // Present Indicative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .first, word: word), "kleubō")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .second, word: word), "kleubizi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .third, word: word), "kleubidi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .first, word: word), "kleubamaz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .second, word: word), "kleubid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .third, word: word), "kleubandi")

        // Past Indicative
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .first, word: word), "klaub")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .second, word: word), "klaubst")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .third, word: word), "klaub")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .first, word: word), "klubum")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .second, word: word), "klubud")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .third, word: word), "klubun")
        
        // Present Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "kleubaų")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "kleubaiz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "kleubai")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "kleubaim")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "kleubaid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "kleubain")
        
        // Imperative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .singular, person: .second, word: word), "kleub")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .second, word: word), "kleubid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .third, word: word), "kleubandau")
    }

}
