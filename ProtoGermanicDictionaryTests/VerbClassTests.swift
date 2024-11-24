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

    func testStrongClass3VerbInflections() {
        // Test for brinnaną (Strong Class III, Vowel Pattern 1)
        let verbClassBrinnan = VerbClass.strongClass3
        let wordBrinnan = "brinnaną" // Example Strong Class III verb with vowel pattern 1

        // Present Indicative
        XCTAssertEqual(verbClassBrinnan.inflection(for: .present, mood: .indicative, number: .singular, person: .first, word: wordBrinnan), "brinnō")
        XCTAssertEqual(verbClassBrinnan.inflection(for: .present, mood: .indicative, number: .singular, person: .second, word: wordBrinnan), "brinnizi")
        XCTAssertEqual(verbClassBrinnan.inflection(for: .present, mood: .indicative, number: .singular, person: .third, word: wordBrinnan), "brinnidi")
        XCTAssertEqual(verbClassBrinnan.inflection(for: .present, mood: .indicative, number: .plural, person: .first, word: wordBrinnan), "brinnamaz")
        XCTAssertEqual(verbClassBrinnan.inflection(for: .present, mood: .indicative, number: .plural, person: .second, word: wordBrinnan), "brinnid")
        XCTAssertEqual(verbClassBrinnan.inflection(for: .present, mood: .indicative, number: .plural, person: .third, word: wordBrinnan), "brinnandi")

        // Past Indicative
        XCTAssertEqual(verbClassBrinnan.inflection(for: .past, mood: .indicative, number: .singular, person: .first, word: wordBrinnan), "brann")
        XCTAssertEqual(verbClassBrinnan.inflection(for: .past, mood: .indicative, number: .singular, person: .second, word: wordBrinnan), "brannst")
        XCTAssertEqual(verbClassBrinnan.inflection(for: .past, mood: .indicative, number: .singular, person: .third, word: wordBrinnan), "brann")
        XCTAssertEqual(verbClassBrinnan.inflection(for: .past, mood: .indicative, number: .plural, person: .first, word: wordBrinnan), "brunnum")
        XCTAssertEqual(verbClassBrinnan.inflection(for: .past, mood: .indicative, number: .plural, person: .second, word: wordBrinnan), "brunnud")
        XCTAssertEqual(verbClassBrinnan.inflection(for: .past, mood: .indicative, number: .plural, person: .third, word: wordBrinnan), "brunnun")
        
        // Present Subjunctive
        XCTAssertEqual(verbClassBrinnan.inflection(for: .present, mood: .subjunctive, number: .singular, person: .first, word: wordBrinnan), "brinnaų")
        XCTAssertEqual(verbClassBrinnan.inflection(for: .present, mood: .subjunctive, number: .singular, person: .second, word: wordBrinnan), "brinnaiz")
        XCTAssertEqual(verbClassBrinnan.inflection(for: .present, mood: .subjunctive, number: .singular, person: .third, word: wordBrinnan), "brinnai")
        XCTAssertEqual(verbClassBrinnan.inflection(for: .present, mood: .subjunctive, number: .plural, person: .first, word: wordBrinnan), "brinnaim")
        XCTAssertEqual(verbClassBrinnan.inflection(for: .present, mood: .subjunctive, number: .plural, person: .second, word: wordBrinnan), "brinnaid")
        XCTAssertEqual(verbClassBrinnan.inflection(for: .present, mood: .subjunctive, number: .plural, person: .third, word: wordBrinnan), "brinnain")
        
        // Imperative
        XCTAssertEqual(verbClassBrinnan.inflection(for: .present, mood: .imperative, number: .singular, person: .second, word: wordBrinnan), "brinn")
        XCTAssertEqual(verbClassBrinnan.inflection(for: .present, mood: .imperative, number: .plural, person: .second, word: wordBrinnan), "brinnid")
        XCTAssertEqual(verbClassBrinnan.inflection(for: .present, mood: .imperative, number: .plural, person: .third, word: wordBrinnan), "brinnandau")
        
        // Test for kerbaną (Strong Class III, Vowel Pattern 2)
        let verbClassKerban = VerbClass.strongClass3
        let wordKerban = "kerbaną" // Example Strong Class III verb with vowel pattern 2

        // Present Indicative
        XCTAssertEqual(verbClassKerban.inflection(for: .present, mood: .indicative, number: .singular, person: .first, word: wordKerban), "kerbō")
        XCTAssertEqual(verbClassKerban.inflection(for: .present, mood: .indicative, number: .singular, person: .second, word: wordKerban), "kerbizi")
        XCTAssertEqual(verbClassKerban.inflection(for: .present, mood: .indicative, number: .singular, person: .third, word: wordKerban), "kerbidi")
        XCTAssertEqual(verbClassKerban.inflection(for: .present, mood: .indicative, number: .plural, person: .first, word: wordKerban), "kerbamaz")
        XCTAssertEqual(verbClassKerban.inflection(for: .present, mood: .indicative, number: .plural, person: .second, word: wordKerban), "kerbid")
        XCTAssertEqual(verbClassKerban.inflection(for: .present, mood: .indicative, number: .plural, person: .third, word: wordKerban), "kerbandi")

        // Past Indicative
        XCTAssertEqual(verbClassKerban.inflection(for: .past, mood: .indicative, number: .singular, person: .first, word: wordKerban), "karb")
        XCTAssertEqual(verbClassKerban.inflection(for: .past, mood: .indicative, number: .singular, person: .second, word: wordKerban), "karbst")
        XCTAssertEqual(verbClassKerban.inflection(for: .past, mood: .indicative, number: .singular, person: .third, word: wordKerban), "karb")
        XCTAssertEqual(verbClassKerban.inflection(for: .past, mood: .indicative, number: .plural, person: .first, word: wordKerban), "kurbum")
        XCTAssertEqual(verbClassKerban.inflection(for: .past, mood: .indicative, number: .plural, person: .second, word: wordKerban), "kurbud")
        XCTAssertEqual(verbClassKerban.inflection(for: .past, mood: .indicative, number: .plural, person: .third, word: wordKerban), "kurbun")
        
        // Present Subjunctive
        XCTAssertEqual(verbClassKerban.inflection(for: .present, mood: .subjunctive, number: .singular, person: .first, word: wordKerban), "kerbaų")
        XCTAssertEqual(verbClassKerban.inflection(for: .present, mood: .subjunctive, number: .singular, person: .second, word: wordKerban), "kerbaiz")
        XCTAssertEqual(verbClassKerban.inflection(for: .present, mood: .subjunctive, number: .singular, person: .third, word: wordKerban), "kerbai")
        XCTAssertEqual(verbClassKerban.inflection(for: .present, mood: .subjunctive, number: .plural, person: .first, word: wordKerban), "kerbaim")
        XCTAssertEqual(verbClassKerban.inflection(for: .present, mood: .subjunctive, number: .plural, person: .second, word: wordKerban), "kerbaid")
        XCTAssertEqual(verbClassKerban.inflection(for: .present, mood: .subjunctive, number: .plural, person: .third, word: wordKerban), "kerbain")
        
        // Imperative
        XCTAssertEqual(verbClassKerban.inflection(for: .present, mood: .imperative, number: .singular, person: .second, word: wordKerban), "kerb")
        XCTAssertEqual(verbClassKerban.inflection(for: .present, mood: .imperative, number: .plural, person: .second, word: wordKerban), "kerbid")
        XCTAssertEqual(verbClassKerban.inflection(for: .present, mood: .imperative, number: .plural, person: .third, word: wordKerban), "kerbandau")
    }
    
    func testStrongClass4VerbInflections() {
        let verbClass = VerbClass.strongClass4
        let word = "kwemaną" // Example Strong Class IV verb

        // Present Indicative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .first, word: word), "kwemō")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .second, word: word), "kwemizi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .third, word: word), "kwemidi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .first, word: word), "kwemamaz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .second, word: word), "kwemid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .third, word: word), "kwemandi")

        // Past Indicative
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .first, word: word), "kwam")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .second, word: word), "kwamst")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .third, word: word), "kwam")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .first, word: word), "kwēmum")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .second, word: word), "kwēmud")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .third, word: word), "kwēmun")
        
        // Present Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "kwemaų")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "kwemaiz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "kwemai")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "kwemaim")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "kwemaid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "kwemain")
        
        // Imperative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .singular, person: .second, word: word), "kwem")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .second, word: word), "kwemid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .third, word: word), "kwemandau")
    }

    func testStrongClass5VerbInflections() {
        let verbClass = VerbClass.strongClass5
        let word = "gebaną" // Example Strong Class V verb

        // Present Indicative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .first, word: word), "gebō")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .second, word: word), "gebizi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .third, word: word), "gebidi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .first, word: word), "gebamaz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .second, word: word), "gebid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .third, word: word), "gebandi")

        // Past Indicative
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .first, word: word), "gab")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .second, word: word), "gabst")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .third, word: word), "gab")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .first, word: word), "gēbum")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .second, word: word), "gēbud")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .third, word: word), "gēbun")
        
        // Present Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "gebaų")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "gebaiz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "gebai")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "gebaim")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "gebaid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "gebain")
        
        // Imperative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .singular, person: .second, word: word), "geb")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .second, word: word), "gebid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .third, word: word), "gebandau")
    }

    func testStrongClass6VerbInflections() {
        let verbClass = VerbClass.strongClass6
        let word = "faraną" // Example Strong Class VI verb

        // Present Indicative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .first, word: word), "farō")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .second, word: word), "farizi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .third, word: word), "faridi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .first, word: word), "faramaz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .second, word: word), "farid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .third, word: word), "farandi")

        // Past Indicative
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .first, word: word), "fōr")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .second, word: word), "fōrst")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .third, word: word), "fōr")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .first, word: word), "fōrum")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .second, word: word), "fōrud")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .third, word: word), "fōrun")
        
        // Present Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "faraų")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "faraiz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "farai")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "faraim")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "faraid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "farain")
        
        // Imperative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .singular, person: .second, word: word), "far")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .second, word: word), "farid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .third, word: word), "farandau")
    }
    
    func testStrongClass7aVerbInflections() {
        let verbClass = VerbClass.strongClass7
        let word = "haitaną" // Example Strong Class 7a verb

        // Present Indicative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .first, word: word), "haitō")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .second, word: word), "haitizi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .third, word: word), "haitidi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .first, word: word), "haitamaz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .second, word: word), "haitid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .third, word: word), "haitandi")

        // Past Indicative
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .first, word: word), "hehait")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .second, word: word), "hehaist")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .third, word: word), "hehait")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .first, word: word), "hehaitum")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .second, word: word), "hehaitud")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .third, word: word), "hehaitun")
        
        // Present Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "haitaų")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "haitaiz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "haitai")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "haitaim")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "haitaid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "haitain")
        
        // Imperative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .singular, person: .second, word: word), "hait")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .second, word: word), "haitid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .third, word: word), "haitandau")
    }
    
    func testStrongClass7bVerbInflections() {
        let verbClass = VerbClass.strongClass7
        let word = "bautaną" // Example Strong Class 7b verb

        // Present Indicative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .first, word: word), "bautō")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .second, word: word), "bautizi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .third, word: word), "bautidi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .first, word: word), "bautamaz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .second, word: word), "bautid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .third, word: word), "bautandi")

        // Past Indicative
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .first, word: word), "bebaut")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .second, word: word), "bebaust")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .third, word: word), "bebaut")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .first, word: word), "bebautum")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .second, word: word), "bebautud")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .third, word: word), "bebautun")
        
        // Present Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "bautaų")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "bautaiz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "bautai")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "bautaim")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "bautaid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "bautain")
        
        // Imperative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .singular, person: .second, word: word), "baut")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .second, word: word), "bautid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .third, word: word), "bautandau")
    }
    
    func testStrongClass7cVerbInflections() {
        let verbClass = VerbClass.strongClass7
        let word = "gangana" // Example Strong Class 7c verb

        // Present Indicative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .first, word: word), "gangō")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .second, word: word), "gangizi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .third, word: word), "gangidi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .first, word: word), "gangamaz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .second, word: word), "gangid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .third, word: word), "gangandi")

        // Past Indicative
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .first, word: word), "gegang")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .second, word: word), "geganst")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .third, word: word), "gegang")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .first, word: word), "gegangum")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .second, word: word), "gegangud")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .third, word: word), "gegangun")
        
        // Present Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "gangaų")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "gangaiz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "gangai")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "gangaim")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "gangaid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "gangain")
        
        // Imperative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .singular, person: .second, word: word), "gang")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .second, word: word), "gangid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .third, word: word), "gangandau")
    }
    
    func testStrongClass7dVerbInflections() {
        let verbClass = VerbClass.strongClass7
        let word = "slēpaną" // Example Strong Class 7d verb

        // Present Indicative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .first, word: word), "slēpō")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .second, word: word), "slēpizi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .third, word: word), "slēpidi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .first, word: word), "slēpamaz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .second, word: word), "slēpid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .third, word: word), "slēpandi")

        // Past Indicative
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .first, word: word), "seslēp")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .second, word: word), "seslēst")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .third, word: word), "seslēp")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .first, word: word), "seslēpum")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .second, word: word), "seslēpud")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .third, word: word), "seslēpun")
        
        // Present Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "slēpaų")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "slēpaiz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "slēpai")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "slēpaim")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "slēpaid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "slēpain")
        
        // Imperative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .singular, person: .second, word: word), "slēp")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .second, word: word), "slēpid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .third, word: word), "slēpandau")
    }
    
    func testStrongClass7eVerbInflections() {
        let verbClass = VerbClass.strongClass7
        let word = "blōtaną" // Example Strong Class 7e verb

        // Present Indicative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .first, word: word), "blōtō")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .second, word: word), "blōtizi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .third, word: word), "blōtidi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .first, word: word), "blōtamaz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .second, word: word), "blōtid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .third, word: word), "blōtandi")

        // Past Indicative
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .first, word: word), "beblōt")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .second, word: word), "beblōst")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .third, word: word), "beblōt")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .first, word: word), "beblōtum")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .second, word: word), "beblōtud")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .third, word: word), "beblōtun")
        
        // Present Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "blōtaų")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "blōtaiz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "blōtai")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "blōtaim")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "blōtaid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "blōtain")
        
        // Imperative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .singular, person: .second, word: word), "blōt")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .second, word: word), "blōtid")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .third, word: word), "blōtandau")
    }
    
    func testWeakClass2VerbInflections() {
        let verbClass = VerbClass.weakClass2
        let word = "gamanōną" // Example Weak Class 2 verb
        
        // Present Indicative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .first, word: word), "gamanō")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .second, word: word), "gamanōsi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .third, word: word), "gamanōþi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .first, word: word), "gamanōmaz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .second, word: word), "gamanōþ")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .third, word: word), "gamanōnþi")
        
        // Past Indicative
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .first, word: word), "gamanōdǭ")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .second, word: word), "gamanōdēz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .third, word: word), "gamanōdē")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .first, word: word), "gamanōdēdum")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .second, word: word), "gamanōdēdud")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .third, word: word), "gamanōdēdun")
        
        // Present Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "gamanǭ")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "gamanōs")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "gamanō")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "gamanōm")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "gamanōþ")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "gamanōn")
        
        // Past Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "gamanōdēdį̄")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "gamanōdēdīz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "gamanōdēdī")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "gamanōdēdīm")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "gamanōdēdīd")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "gamanōdēdīn")
        
        // Imperative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .singular, person: .second, word: word), "gamanō")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .second, word: word), "gamanōþ")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .third, word: word), "gamanōnþau")
    }
    
    func testWeakClass3VerbInflections() {
        let verbClass = VerbClass.weakClass3
        let word = "dagāną" // Example Weak Class 3 verb
        
        // Present Indicative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .first, word: word), "dagō")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .second, word: word), "dagaisi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .third, word: word), "dagaiþi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .first, word: word), "dagāmaz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .second, word: word), "dagaiþ")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .third, word: word), "dagānþi")
        
        // Past Indicative
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .first, word: word), "dagadǭ")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .second, word: word), "dagadēz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .third, word: word), "dagadē")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .first, word: word), "dagadēdum")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .second, word: word), "dagadēdud")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .third, word: word), "dagadēdun")
        
        // Present Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "dagaų")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "dagis")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "dagai")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "dagaim")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "dagaiþ")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "dagain")
        
        // Past Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "dagadēdį̄")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "dagadēdīz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "dagadēdī")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "dagadēdīm")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "dagadēdīd")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "dagadēdīn")
        
        // Imperative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .singular, person: .second, word: word), "dagai")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .second, word: word), "dagaiþ")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .third, word: word), "dagānþau")
    }
    
    func testWeakClass4VerbInflections() {
        let verbClass = VerbClass.weakClass4
        let word = "sturknaną" // Example Weak Class 4 verb
        
        // Present Indicative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .first, word: word), "sturknō")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .second, word: word), "sturknōsi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .third, word: word), "sturknōþi")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .first, word: word), "sturknāmaz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .second, word: word), "sturknāþ")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .third, word: word), "sturknanþi")
        
        // Past Indicative
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .first, word: word), "sturknōdǭ")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .second, word: word), "sturknōdēz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .third, word: word), "sturknōdē")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .first, word: word), "sturknōdēdum")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .second, word: word), "sturknōdēdud")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .third, word: word), "sturknōdēdun")
        
        // Present Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "sturknaų")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "sturknais")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "sturknai")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "sturknaim")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "sturknaiþ")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "sturknain")
        
        // Past Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "sturknōdēdį̄")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "sturknōdēdīz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "sturknōdēdī")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "sturknōdēdīm")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "sturknōdēdīd")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "sturknōdēdīn")
        
        // Imperative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .singular, person: .second, word: word), "sturknō")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .second, word: word), "sturknaþ")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .imperative, number: .plural, person: .third, word: word), "sturknanþau")
    }
    
    func testPreteritePresentVerbMaganą() {
        let verbClass = VerbClass.preteritePresent
        let word = "maganą" // Example Preterite-Present verb

        // Present Indicative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .first, word: word), "mag")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .second, word: word), "maht")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .third, word: word), "mag")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .dual, person: .first, word: word), "magū")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .dual, person: .second, word: word), "magudiz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .first, word: word), "magum")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .second, word: word), "magud")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .third, word: word), "magun")

        // Present Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "magį̄")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "magīz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "magī")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .dual, person: .first, word: word), "magīw")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .dual, person: .second, word: word), "magīdiz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "magīm")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "magīd")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "magīn")

        // Past Indicative
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .first, word: word), "mahtǭ")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .second, word: word), "mahtēz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .third, word: word), "mahtē")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .dual, person: .first, word: word), "mahtēdū")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .dual, person: .second, word: word), "mahtēdudiz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .first, word: word), "mahtēdum")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .second, word: word), "mahtēdud")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .third, word: word), "mahtēdun")

        // Past Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "mahtēdį̄")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "mahtēdīz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "mahtēdī")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .dual, person: .first, word: word), "mahtēdīw")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .dual, person: .second, word: word), "mahtēdīdiz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "mahtēdīm")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "mahtēdīd")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "mahtēdīn")
    }
    
    func testPreteritePresentVerbLizana() {
        let verbClass = VerbClass.preteritePresent
        let word = "lizaną" // Example Preterite-Present verb

        // Present Indicative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .first, word: word), "lais")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .second, word: word), "laist")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .third, word: word), "lais")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .dual, person: .first, word: word), "lizū")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .dual, person: .second, word: word), "lizudiz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .first, word: word), "lizum")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .second, word: word), "lizud")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .third, word: word), "lizun")

        // Present Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "lizį̄")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "lizīz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "lizī")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .dual, person: .first, word: word), "lizīw")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .dual, person: .second, word: word), "lizīdiz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "lizīm")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "lizīd")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "lizīn")

        // Past Indicative
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .first, word: word), "listǭ")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .second, word: word), "listēz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .third, word: word), "listē")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .dual, person: .first, word: word), "listēdū")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .dual, person: .second, word: word), "listēdudiz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .first, word: word), "listēdum")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .second, word: word), "listēdud")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .third, word: word), "listēdun")

        // Past Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "listēdį̄")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "listēdīz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "listēdī")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .dual, person: .first, word: word), "listēdīw")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .dual, person: .second, word: word), "listēdīdiz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "listēdīm")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "listēdīd")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "listēdīn")
    }
    
    func testPreteritePresentVerbWitana() {
        let verbClass = VerbClass.preteritePresent
        let word = "witaną" // Example Preterite-Present verb

        // Present Indicative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .first, word: word), "wait")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .second, word: word), "waist")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .third, word: word), "wait")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .dual, person: .first, word: word), "witū")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .dual, person: .second, word: word), "witudiz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .first, word: word), "witum")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .second, word: word), "witud")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .third, word: word), "witun")

        // Present Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "witį̄")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "witīz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "witī")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .dual, person: .first, word: word), "witīw")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .dual, person: .second, word: word), "witīdiz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "witīm")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "witīd")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "witīn")

        // Past Indicative
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .first, word: word), "wissǭ")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .second, word: word), "wissēz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .third, word: word), "wissē")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .dual, person: .first, word: word), "wissēdū")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .dual, person: .second, word: word), "wissēdudiz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .first, word: word), "wissēdum")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .second, word: word), "wissēdud")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .third, word: word), "wissēdun")

        // Past Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "wissēdį̄")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "wissēdīz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "wissēdī")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .dual, person: .first, word: word), "wissēdīw")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .dual, person: .second, word: word), "wissēdīdiz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "wissēdīm")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "wissēdīd")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "wissēdīn")
    }
    
    func testPreteritePresentVerbThurbana() {
        let verbClass = VerbClass.preteritePresent
        let word = "þurbaną" // Example Preterite-Present verb

        // Present Indicative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .first, word: word), "þarf")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .second, word: word), "þarft")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .third, word: word), "þarf")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .dual, person: .first, word: word), "þurbū")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .dual, person: .second, word: word), "þurbudiz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .first, word: word), "þurbum")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .second, word: word), "þurbud")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .third, word: word), "þurbun")

        // Present Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "þurbį̄")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "þurbīz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "þurbī")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .dual, person: .first, word: word), "þurbīw")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .dual, person: .second, word: word), "þurbīdiz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "þurbīm")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "þurbīd")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "þurbīn")

        // Past Indicative
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .first, word: word), "þurftǭ")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .second, word: word), "þurftēz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .third, word: word), "þurftē")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .dual, person: .first, word: word), "þurftēdū")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .dual, person: .second, word: word), "þurftēdudiz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .first, word: word), "þurftēdum")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .second, word: word), "þurftēdud")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .third, word: word), "þurftēdun")

        // Past Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "þurftēdį̄")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "þurftēdīz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "þurftēdī")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .dual, person: .first, word: word), "þurftēdīw")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .dual, person: .second, word: word), "þurftēdīdiz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "þurftēdīm")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "þurftēdīd")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "þurftēdīn")
    }
    
    func testPreteritePresentVerbSkulana() {
        let verbClass = VerbClass.preteritePresent
        let word = "skulaną" // Example Preterite-Present verb

        // Present Indicative
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .first, word: word), "skal")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .second, word: word), "skalt")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .singular, person: .third, word: word), "skal")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .dual, person: .first, word: word), "skulū")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .dual, person: .second, word: word), "skuludiz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .first, word: word), "skulum")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .second, word: word), "skulud")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .indicative, number: .plural, person: .third, word: word), "skulun")

        // Present Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .first, word: word), "skulį̄")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .second, word: word), "skulīz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .singular, person: .third, word: word), "skulī")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .dual, person: .first, word: word), "skulīw")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .dual, person: .second, word: word), "skulīdiz")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .first, word: word), "skulīm")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .second, word: word), "skulīd")
        XCTAssertEqual(verbClass.inflection(for: .present, mood: .subjunctive, number: .plural, person: .third, word: word), "skulīn")

        // Past Indicative
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .first, word: word), "skuldǭ")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .second, word: word), "skuldēz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .singular, person: .third, word: word), "skuldē")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .dual, person: .first, word: word), "skuldēdū")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .dual, person: .second, word: word), "skuldēdudiz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .first, word: word), "skuldēdum")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .second, word: word), "skuldēdud")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .indicative, number: .plural, person: .third, word: word), "skuldēdun")

        // Past Subjunctive
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .first, word: word), "skuldēdį̄")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .second, word: word), "skuldēdīz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .singular, person: .third, word: word), "skuldēdī")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .dual, person: .first, word: word), "skuldēdīw")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .dual, person: .second, word: word), "skuldēdīdiz")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .first, word: word), "skuldēdīm")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .second, word: word), "skuldēdīd")
        XCTAssertEqual(verbClass.inflection(for: .past, mood: .subjunctive, number: .plural, person: .third, word: word), "skuldēdīn")
    }
}
