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
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "bīdō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "bīdizi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "bīdidi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "bīdamaz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "bīdid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "bīdandi")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "baid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "baidst")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "baid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "bidum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "bidud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "bidun")
        
        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "bīdaų")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "bīdaiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "bīdai")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "bīdaim")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "bīdaid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "bīdain")
        
        // Imperative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .second, word: word), "bīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .second, word: word), "bīdid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .third, word: word), "bīdandau")
    }
    
    func testStrongClass2VerbInflections() {
        let verbClass = VerbClass.strongClass2
        let word = "kleubana" // Example Strong Class II verb

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "kleubō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "kleubizi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "kleubidi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "kleubamaz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "kleubid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "kleubandi")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "klaub")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "klaubst")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "klaub")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "klubum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "klubud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "klubun")
        
        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "kleubaų")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "kleubaiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "kleubai")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "kleubaim")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "kleubaid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "kleubain")
        
        // Imperative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .second, word: word), "kleub")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .second, word: word), "kleubid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .third, word: word), "kleubandau")
    }

    func testStrongClass3VerbInflections() {
        // Test for brinnaną (Strong Class III, Vowel Pattern 1)
        let verbClass = VerbClass.strongClass3
        let wordBrinnan = "brinnaną" // Example Strong Class III verb with vowel pattern 1

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: wordBrinnan), "brinnō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: wordBrinnan), "brinnizi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: wordBrinnan), "brinnidi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: wordBrinnan), "brinnamaz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: wordBrinnan), "brinnid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: wordBrinnan), "brinnandi")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: wordBrinnan), "brann")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: wordBrinnan), "brannst")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: wordBrinnan), "brann")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: wordBrinnan), "brunnum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: wordBrinnan), "brunnud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: wordBrinnan), "brunnun")
        
        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: wordBrinnan), "brinnaų")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: wordBrinnan), "brinnaiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: wordBrinnan), "brinnai")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: wordBrinnan), "brinnaim")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: wordBrinnan), "brinnaid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: wordBrinnan), "brinnain")
        
        // Imperative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .second, word: wordBrinnan), "brinn")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .second, word: wordBrinnan), "brinnid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .third, word: wordBrinnan), "brinnandau")
        
        // Test for kerbaną (Strong Class III, Vowel Pattern 2)
        let wordKerban = "kerbaną" // Example Strong Class III verb with vowel pattern 2

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: wordKerban), "kerbō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: wordKerban), "kerbizi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: wordKerban), "kerbidi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: wordKerban), "kerbamaz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: wordKerban), "kerbid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: wordKerban), "kerbandi")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: wordKerban), "karb")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: wordKerban), "karbst")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: wordKerban), "karb")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: wordKerban), "kurbum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: wordKerban), "kurbud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: wordKerban), "kurbun")
        
        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: wordKerban), "kerbaų")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: wordKerban), "kerbaiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: wordKerban), "kerbai")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: wordKerban), "kerbaim")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: wordKerban), "kerbaid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: wordKerban), "kerbain")
        
        // Imperative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .second, word: wordKerban), "kerb")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .second, word: wordKerban), "kerbid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .third, word: wordKerban), "kerbandau")
    }
    
    func testStrongClass4VerbInflections() {
        let verbClass = VerbClass.strongClass4
        let word = "kwemaną" // Example Strong Class IV verb

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "kwemō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "kwemizi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "kwemidi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "kwemamaz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "kwemid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "kwemandi")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "kwam")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "kwamst")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "kwam")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "kwēmum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "kwēmud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "kwēmun")
        
        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "kwemaų")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "kwemaiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "kwemai")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "kwemaim")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "kwemaid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "kwemain")
        
        // Imperative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .second, word: word), "kwem")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .second, word: word), "kwemid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .third, word: word), "kwemandau")
    }

    func testStrongClass5VerbInflections() {
        let verbClass = VerbClass.strongClass5
        let word = "gebaną" // Example Strong Class V verb

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "gebō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "gebizi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "gebidi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "gebamaz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "gebid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "gebandi")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "gab")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "gabst")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "gab")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "gēbum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "gēbud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "gēbun")
        
        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "gebaų")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "gebaiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "gebai")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "gebaim")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "gebaid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "gebain")
        
        // Imperative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .second, word: word), "geb")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .second, word: word), "gebid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .third, word: word), "gebandau")
    }

    func testStrongClass6VerbInflections() {
        let verbClass = VerbClass.strongClass6
        let word = "faraną" // Example Strong Class VI verb

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "farō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "farizi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "faridi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "faramaz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "farid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "farandi")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "fōr")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "fōrst")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "fōr")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "fōrum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "fōrud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "fōrun")
        
        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "faraų")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "faraiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "farai")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "faraim")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "faraid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "farain")
        
        // Imperative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .second, word: word), "far")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .second, word: word), "farid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .third, word: word), "farandau")
    }
    
    func testStrongClass7aVerbInflections() {
        let verbClass = VerbClass.strongClass7
        let word = "haitaną" // Example Strong Class 7a verb

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "haitō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "haitizi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "haitidi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "haitamaz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "haitid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "haitandi")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "hehait")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "hehaist")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "hehait")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "hehaitum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "hehaitud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "hehaitun")
        
        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "haitaų")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "haitaiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "haitai")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "haitaim")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "haitaid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "haitain")
        
        // Imperative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .second, word: word), "hait")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .second, word: word), "haitid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .third, word: word), "haitandau")
    }
    
    func testStrongClass7bVerbInflections() {
        let verbClass = VerbClass.strongClass7
        let word = "bautaną" // Example Strong Class 7b verb

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "bautō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "bautizi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "bautidi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "bautamaz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "bautid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "bautandi")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "bebaut")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "bebaust")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "bebaut")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "bebautum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "bebautud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "bebautun")
        
        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "bautaų")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "bautaiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "bautai")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "bautaim")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "bautaid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "bautain")
        
        // Imperative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .second, word: word), "baut")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .second, word: word), "bautid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .third, word: word), "bautandau")
    }
    
    func testStrongClass7cVerbInflections() {
        let verbClass = VerbClass.strongClass7
        let word = "gangana" // Example Strong Class 7c verb

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "gangō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "gangizi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "gangidi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "gangamaz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "gangid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "gangandi")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "gegang")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "geganst")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "gegang")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "gegangum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "gegangud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "gegangun")
        
        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "gangaų")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "gangaiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "gangai")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "gangaim")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "gangaid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "gangain")
        
        // Imperative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .second, word: word), "gang")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .second, word: word), "gangid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .third, word: word), "gangandau")
    }
    
    func testStrongClass7dVerbInflections() {
        let verbClass = VerbClass.strongClass7
        let word = "slēpaną" // Example Strong Class 7d verb

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "slēpō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "slēpizi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "slēpidi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "slēpamaz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "slēpid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "slēpandi")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "seslēp")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "seslēst")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "seslēp")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "seslēpum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "seslēpud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "seslēpun")
        
        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "slēpaų")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "slēpaiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "slēpai")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "slēpaim")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "slēpaid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "slēpain")
        
        // Imperative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .second, word: word), "slēp")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .second, word: word), "slēpid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .third, word: word), "slēpandau")
    }
    
    func testStrongClass7eVerbInflections() {
        let verbClass = VerbClass.strongClass7
        let word = "blōtaną" // Example Strong Class 7e verb

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "blōtō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "blōtizi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "blōtidi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "blōtamaz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "blōtid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "blōtandi")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "beblōt")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "beblōst")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "beblōt")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "beblōtum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "beblōtud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "beblōtun")
        
        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "blōtaų")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "blōtaiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "blōtai")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "blōtaim")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "blōtaid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "blōtain")
        
        // Imperative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .second, word: word), "blōt")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .second, word: word), "blōtid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .third, word: word), "blōtandau")
    }
    
    func testWeakClass2VerbInflections() {
        let verbClass = VerbClass.weakClass2
        let word = "gamanōną" // Example Weak Class 2 verb
        
        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "gamanō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "gamanōsi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "gamanōþi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "gamanōmaz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "gamanōþ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "gamanōnþi")
        
        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "gamanōdǭ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "gamanōdēz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "gamanōdē")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "gamanōdēdum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "gamanōdēdud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "gamanōdēdun")
        
        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "gamanǭ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "gamanōs")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "gamanō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "gamanōm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "gamanōþ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "gamanōn")
        
        // Past Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "gamanōdēdį̄")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "gamanōdēdīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "gamanōdēdī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "gamanōdēdīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "gamanōdēdīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "gamanōdēdīn")
        
        // Imperative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .second, word: word), "gamanō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .second, word: word), "gamanōþ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .third, word: word), "gamanōnþau")
    }
    
    func testWeakClass3VerbInflections() {
        let verbClass = VerbClass.weakClass3
        let word = "dagāną" // Example Weak Class 3 verb
        
        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "dagō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "dagaisi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "dagaiþi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "dagāmaz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "dagaiþ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "dagānþi")
        
        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "dagadǭ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "dagadēz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "dagadē")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "dagadēdum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "dagadēdud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "dagadēdun")
        
        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "dagaų")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "dagis")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "dagai")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "dagaim")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "dagaiþ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "dagain")
        
        // Past Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "dagadēdį̄")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "dagadēdīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "dagadēdī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "dagadēdīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "dagadēdīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "dagadēdīn")
        
        // Imperative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .second, word: word), "dagai")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .second, word: word), "dagaiþ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .third, word: word), "dagānþau")
    }
    
    func testWeakClass4VerbInflections() {
        let verbClass = VerbClass.weakClass4
        let word = "sturknaną" // Example Weak Class 4 verb
        
        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "sturknō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "sturknōsi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "sturknōþi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "sturknāmaz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "sturknāþ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "sturknanþi")
        
        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "sturknōdǭ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "sturknōdēz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "sturknōdē")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "sturknōdēdum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "sturknōdēdud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "sturknōdēdun")
        
        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "sturknaų")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "sturknais")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "sturknai")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "sturknaim")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "sturknaiþ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "sturknain")
        
        // Past Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "sturknōdēdį̄")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "sturknōdēdīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "sturknōdēdī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "sturknōdēdīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "sturknōdēdīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "sturknōdēdīn")
        
        // Imperative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .second, word: word), "sturknō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .second, word: word), "sturknaþ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .third, word: word), "sturknanþau")
    }
    
    func testPreteritePresentVerbMaganą() {
        let verbClass = VerbClass.preteritePresent
        let word = "maganą" // Example Preterite-Present verb

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "mag")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "maht")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "mag")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .first, word: word), "magū")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .second, word: word), "magudiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "magum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "magud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "magun")

        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "magį̄")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "magīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "magī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .dual, person: .first, word: word), "magīw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .dual, person: .second, word: word), "magīdiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "magīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "magīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "magīn")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "mahtǭ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "mahtēz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "mahtē")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .first, word: word), "mahtēdū")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .second, word: word), "mahtēdudiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "mahtēdum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "mahtēdud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "mahtēdun")

        // Past Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "mahtēdį̄")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "mahtēdīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "mahtēdī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .first, word: word), "mahtēdīw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .second, word: word), "mahtēdīdiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "mahtēdīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "mahtēdīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "mahtēdīn")
    }
    
    func testPreteritePresentVerbLizana() {
        let verbClass = VerbClass.preteritePresent
        let word = "lizaną" // Example Preterite-Present verb

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "lais")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "laist")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "lais")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .first, word: word), "lizū")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .second, word: word), "lizudiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "lizum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "lizud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "lizun")

        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "lizį̄")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "lizīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "lizī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .dual, person: .first, word: word), "lizīw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .dual, person: .second, word: word), "lizīdiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "lizīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "lizīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "lizīn")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "listǭ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "listēz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "listē")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .first, word: word), "listēdū")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .second, word: word), "listēdudiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "listēdum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "listēdud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "listēdun")

        // Past Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "listēdį̄")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "listēdīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "listēdī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .first, word: word), "listēdīw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .second, word: word), "listēdīdiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "listēdīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "listēdīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "listēdīn")
    }
    
    func testPreteritePresentVerbWitana() {
        let verbClass = VerbClass.preteritePresent
        let word = "witaną" // Example Preterite-Present verb

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "wait")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "waist")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "wait")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .first, word: word), "witū")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .second, word: word), "witudiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "witum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "witud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "witun")

        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "witį̄")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "witīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "witī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .dual, person: .first, word: word), "witīw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .dual, person: .second, word: word), "witīdiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "witīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "witīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "witīn")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "wissǭ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "wissēz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "wissē")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .first, word: word), "wissēdū")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .second, word: word), "wissēdudiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "wissēdum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "wissēdud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "wissēdun")

        // Past Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "wissēdį̄")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "wissēdīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "wissēdī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .first, word: word), "wissēdīw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .second, word: word), "wissēdīdiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "wissēdīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "wissēdīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "wissēdīn")
    }
    
    func testPreteritePresentVerbThurbana() {
        let verbClass = VerbClass.preteritePresent
        let word = "þurbaną" // Example Preterite-Present verb

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "þarf")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "þarft")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "þarf")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .first, word: word), "þurbū")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .second, word: word), "þurbudiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "þurbum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "þurbud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "þurbun")

        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "þurbį̄")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "þurbīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "þurbī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .dual, person: .first, word: word), "þurbīw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .dual, person: .second, word: word), "þurbīdiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "þurbīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "þurbīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "þurbīn")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "þurftǭ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "þurftēz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "þurftē")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .first, word: word), "þurftēdū")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .second, word: word), "þurftēdudiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "þurftēdum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "þurftēdud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "þurftēdun")

        // Past Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "þurftēdį̄")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "þurftēdīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "þurftēdī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .first, word: word), "þurftēdīw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .second, word: word), "þurftēdīdiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "þurftēdīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "þurftēdīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "þurftēdīn")
    }
    
    func testPreteritePresentVerbSkulana() {
        let verbClass = VerbClass.preteritePresent
        let word = "skulaną" // Example Preterite-Present verb

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "skal")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "skalt")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "skal")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .first, word: word), "skulū")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .second, word: word), "skuludiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "skulum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "skulud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "skulun")

        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "skulį̄")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "skulīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "skulī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .dual, person: .first, word: word), "skulīw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .dual, person: .second, word: word), "skulīdiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "skulīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "skulīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "skulīn")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "skuldǭ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "skuldēz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "skuldē")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .first, word: word), "skuldēdū")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .second, word: word), "skuldēdudiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "skuldēdum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "skuldēdud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "skuldēdun")

        // Past Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "skuldēdį̄")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "skuldēdīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "skuldēdī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .first, word: word), "skuldēdīw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .second, word: word), "skuldēdīdiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "skuldēdīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "skuldēdīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "skuldēdīn")
    }
    
    func testIrregularVerbStana() {
        let verbClass = VerbClass.irregular
        let word = "stāną" // Example irregular verb

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "stō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "staisi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "staiþi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .first, word: word), "stōs")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .second, word: word), "stāþiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "stāmaz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "staiþ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "stānþi")

        // Present Imperative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .second, word: word), "stai")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .second, word: word), "staiþ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .third, word: word), "stānþau")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "stōþ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "stōst")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "stōþ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .first, word: word), "stōdū")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .second, word: word), "stōdudiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "stōdum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "stōdud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "stōdun")

        // Past Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "stōdį̄")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "stōdīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "stōdī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .first, word: word), "stōdīw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .second, word: word), "stōdīdiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "stōdīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "stōdīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "stōdīn")
    }
    
    func testIrregularVerbGana() {
        let verbClass = VerbClass.irregular
        let word = "gāną" // Example irregular verb

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "gō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "gaisi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "gaiþi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .first, word: word), "gōs")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .second, word: word), "gāþiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "gāmaz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "gaiþ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "gānþi")

        // Present Imperative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .second, word: word), "gai")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .third, word: word), "gāþau")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .dual, person: .second, word: word), "gāþiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .second, word: word), "gaiþ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .third, word: word), "gānþau")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "ijjǭ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "ijjēz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "ijjē")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .first, word: word), "ijjēdū")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .second, word: word), "ijjēdudiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "ijjēdum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "ijjēdud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "ijjēdun")

        // Past Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "ijjēdį̄")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "ijjēdīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "ijjēdī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .first, word: word), "ijjēdīw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .second, word: word), "ijjēdīdiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "ijjēdīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "ijjēdīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "ijjēdīn")
    }

    func testIrregularVerbAigana() {
        let verbClass = VerbClass.irregular
        let word = "aiganą" // Example irregular verb

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "aih")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "aiht")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "aih")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .first, word: word), "aigū")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .second, word: word), "aigudiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "aigum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "aigud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "aigun")

        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "aigį̄")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "aigīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "aigī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .dual, person: .first, word: word), "aigīw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .dual, person: .second, word: word), "aigīdiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "aigīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "aigīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "aigīn")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "aihtǭ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "aihtēz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "aihtē")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .first, word: word), "aihtēdū")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .second, word: word), "aihtēdudiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "aihtēdum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "aihtēdud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "aihtēdun")

        // Past Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "aihtēdį̄")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "aihtēdīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "aihtēdī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .first, word: word), "aihtēdīw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .second, word: word), "aihtēdīdiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "aihtēdīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "aihtēdīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "aihtēdīn")
    }
    
    func testIrregularVerbDōną() {
        let verbClass = VerbClass.irregular
        let word = "dōną" // Example irregular verb

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "dōmi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "dōsi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "dōþi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .first, word: word), "dōs")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .second, word: word), "dōþiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "dōmaz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "dōþ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "dōnþi")

        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "dǭ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "dōs")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "dō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .dual, person: .first, word: word), "dōw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .dual, person: .second, word: word), "dōþiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "dōm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "dōþ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "dōn")

        // Present Imperative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .second, word: word), "dō")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .third, word: word), "dōþau")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .dual, person: .second, word: word), "dōþiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .second, word: word), "dōþ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .third, word: word), "dōnþau")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "dedǭ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "dedēz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "dedē")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .first, word: word), "dēdū")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .second, word: word), "dēdudiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "dēdum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "dēdud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "dēdun")

        // Past Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "dēdį̄")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "dēdīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "dēdī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .first, word: word), "dēdīw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .second, word: word), "dēdīdiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "dēdīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "dēdīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "dēdīn")
    }

    func testIrregularVerbWiljaną() {
        let verbClass = VerbClass.irregular
        let word = "wiljaną" // Example irregular defective verb

        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "wiljų")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "wilīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "wilī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .dual, person: .first, word: word), "wilīw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .dual, person: .second, word: word), "wilīdiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "wilīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "wilīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "wilīn")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "weldǭ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "weldēz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "weldē")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .first, word: word), "weldēdū")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .second, word: word), "weldēdudiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "weldēdum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "weldēdud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "weldēdun")

        // Past Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "weldēdį̄")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "weldēdīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "weldēdī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .first, word: word), "weldēdīw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .second, word: word), "weldēdīdiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "weldēdīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "weldēdīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "weldēdīn")
    }

    func testIrregularVerbBeuną() {
        let verbClass = VerbClass.irregular
        let word = "beuną" // Example irregular verb

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "biumi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "biusi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "biuþi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .first, word: word), "beū")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .second, word: word), "biuþiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "beum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "beud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "biunþi")

        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "biwjǭ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "biwjēs")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "biwjē")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .dual, person: .first, word: word), "biwīw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .dual, person: .second, word: word), "biwīþiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "biwīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "biwīþ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "biwīn")

        // Present Imperative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .second, word: word), "beu")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .third, word: word), "beuþau")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .dual, person: .second, word: word), "biudiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .second, word: word), "beuþ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .third, word: word), "beunþau")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "was")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "wast")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "was")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .first, word: word), "wēzū")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .second, word: word), "wēzudiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "wēzum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "wēzud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "wēzun")

        // Past Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "wēzį̄")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "wēzīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "wēzī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .first, word: word), "wēzīw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .second, word: word), "wēzīdiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "wēzīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "wēzīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "wēzīn")
    }

    func testIrregularVerbWesaną() {
        let verbClass = VerbClass.irregular
        let word = "wesaną" // Example irregular verb

        // Present Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .first, word: word), "immi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .second, word: word), "izi")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .singular, person: .third, word: word), "isti")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .first, word: word), "izū")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .dual, person: .second, word: word), "izudiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .first, word: word), "izum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .second, word: word), "izud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .indicative, number: .plural, person: .third, word: word), "sindi")

        // Present Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "sijǭ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "sijēs")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "sijē")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .dual, person: .first, word: word), "sīw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .dual, person: .second, word: word), "sīþiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "sīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "sīþ")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "sīn")

        // Present Imperative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .second, word: word), "wes")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .singular, person: .third, word: word), "wesadau")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .dual, person: .second, word: word), "wesadiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .second, word: word), "wisid")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .present, mood: .imperative, number: .plural, person: .third, word: word), "wesandau")

        // Past Indicative
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .first, word: word), "was")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .second, word: word), "wast")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .singular, person: .third, word: word), "was")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .first, word: word), "wēzū")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .dual, person: .second, word: word), "wēzudiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .first, word: word), "wēzum")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .second, word: word), "wēzud")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .indicative, number: .plural, person: .third, word: word), "wēzun")

        // Past Subjunctive
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "wēzį̄")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "wēzīz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "wēzī")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .first, word: word), "wēzīw")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .dual, person: .second, word: word), "wēzīdiz")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "wēzīm")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "wēzīd")
        XCTAssertEqual(VerbInflectionService.inflect(verbClass: verbClass, for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "wēzīn")
    }

}
