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

}
