//
//  NounStemInflectionTests.swift
//  ProtoGermanicDictionaryTests
//
//  Created by Andrey Skurlatov on 12/11/2024.
//


import XCTest
@testable import ProtoGermanicDictionary

class NounInflectionServiceTest: XCTestCase {
    
    func testMasculineAStemInflections() {
        let nounStem = NounStem.aStem
        let word = "Dagaz" // Example masculine a-stem noun
        let gender = GrammaticalGender.masculine
        
        // Test cases for Dagaz (masculine a-stem)
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .singular, gender: gender, word: word), "Dagaz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .plural, gender: gender, word: word), "Dagōz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .singular, gender: gender, word: word), "Dag")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .plural, gender: gender, word: word), "Dagōz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .singular, gender: gender, word: word), "Dagą")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .plural, gender: gender, word: word), "Daganz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .singular, gender: gender, word: word), "Dagas")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .plural, gender: gender, word: word), "Dagǫ̂")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .singular, gender: gender, word: word), "Dagai")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .plural, gender: gender, word: word), "Dagamaz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .singular, gender: gender, word: word), "Dagō")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .plural, gender: gender, word: word), "Dagamiz")
    }
    
    func testNeuterAStemInflections() {
        let nounStem = NounStem.aStem
        let word = "Baką" // Example neuter a-stem noun
        let gender = GrammaticalGender.neuter
        
        // Test cases for Baką (neuter a-stem)
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .singular, gender: gender, word: word), "Baką")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .plural, gender: gender, word: word), "Bakō")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .singular, gender: gender, word: word), "Baką")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .plural, gender: gender, word: word), "Bakō")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .singular, gender: gender, word: word), "Baką")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .plural, gender: gender, word: word), "Bakō")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .singular, gender: gender, word: word), "Bakas")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .plural, gender: gender, word: word), "Bakǫ̂")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .singular, gender: gender, word: word), "Bakai")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .plural, gender: gender, word: word), "Bakamaz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .singular, gender: gender, word: word), "Bakō")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .plural, gender: gender, word: word), "Bakamiz")
    }
    
    // Test for ja-stem masculine noun "Harjaz"
    func testMasculineJaStemInflections() {
        let nounStem = NounStem.jaStem
        let word = "Harjaz" // Example masculine ja-stem noun
        let gender = GrammaticalGender.masculine
        
        // Test cases for Harjaz (masculine ja-stem)
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .singular, gender: gender, word: word), "Harjaz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .plural, gender: gender, word: word), "Harjōz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .singular, gender: gender, word: word), "Hari")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .plural, gender: gender, word: word), "Harjōz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .singular, gender: gender, word: word), "Harją")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .plural, gender: gender, word: word), "Harjanz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .singular, gender: gender, word: word), "Harjas")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .plural, gender: gender, word: word), "Harjǫ̂")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .singular, gender: gender, word: word), "Harjai")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .plural, gender: gender, word: word), "Harjamaz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .singular, gender: gender, word: word), "Harjō")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .plural, gender: gender, word: word), "Harjamiz")
    }
    
    // Test for ja-stem neuter noun "Abniją"
    func testNeuterJaStemInflections() {
        let nounStem = NounStem.jaStem
        let word = "Abniją" // Example neuter ja-stem noun
        let gender = GrammaticalGender.neuter
        
        // Test cases for Abniją (neuter ja-stem)
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .singular, gender: gender, word: word), "Abniją")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .plural, gender: gender, word: word), "Abnijō")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .singular, gender: gender, word: word), "Abniją")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .plural, gender: gender, word: word), "Abnijō")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .singular, gender: gender, word: word), "Abniją")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .plural, gender: gender, word: word), "Abnijō")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .singular, gender: gender, word: word), "Abnijas")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .plural, gender: gender, word: word), "Abnijǫ̂")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .singular, gender: gender, word: word), "Abnijai")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .plural, gender: gender, word: word), "Abnijamaz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .singular, gender: gender, word: word), "Abnijō")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .plural, gender: gender, word: word), "Abnijamiz")
    }
    
    
    // Test for o-stem feminine noun "frijō"
    func testFeminineOStemInflections() {
        let nounStem = NounStem.oStem
        let word = "frijō" // Example feminine o-stem noun
        let gender = GrammaticalGender.feminine
        
        // Test cases for frijō (feminine o-stem)
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .singular, gender: gender, word: word), "frijō")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .plural, gender: gender, word: word), "frijôz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .singular, gender: gender, word: word), "frijō")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .plural, gender: gender, word: word), "frijôz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .singular, gender: gender, word: word), "frijǭ")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .plural, gender: gender, word: word), "frijōz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .singular, gender: gender, word: word), "frijōz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .plural, gender: gender, word: word), "frijǫ̂")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .singular, gender: gender, word: word), "frijōi")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .plural, gender: gender, word: word), "frijōmaz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .singular, gender: gender, word: word), "frijō")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .plural, gender: gender, word: word), "frijōmiz")
    }
    
    // Test for ij-stem feminine noun "unþī"
    func testFeminineIjStemInflections() {
        let nounStem = NounStem.ijStem
        let word = "unþī" // Example feminine ij-stem noun
        let gender = GrammaticalGender.feminine
        
        // Test cases for unþī (feminine ij-stem)
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .singular, gender: gender, word: word), "unþī")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .plural, gender: gender, word: word), "unþijôz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .singular, gender: gender, word: word), "unþī")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .plural, gender: gender, word: word), "unþijôz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .singular, gender: gender, word: word), "unþijǭ")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .plural, gender: gender, word: word), "unþijōz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .singular, gender: gender, word: word), "unþijōz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .plural, gender: gender, word: word), "unþijǫ̂")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .singular, gender: gender, word: word), "unþijōi")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .plural, gender: gender, word: word), "unþijōmaz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .singular, gender: gender, word: word), "unþijō")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .plural, gender: gender, word: word), "unþijōmiz")
    }
    
    func testMasculineIStemInflectionsForAlgiz() {
        let nounStem = NounStem.iStem
        let word = "algiz"
        let gender = GrammaticalGender.masculine
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .singular, gender: gender, word: word), "algiz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .plural, gender: gender, word: word), "algīz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .singular, gender: gender, word: word), "algi")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .plural, gender: gender, word: word), "algīz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .singular, gender: gender, word: word), "algį")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .plural, gender: gender, word: word), "alginz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .singular, gender: gender, word: word), "algīz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .plural, gender: gender, word: word), "algijǫ̂")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .singular, gender: gender, word: word), "algī")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .plural, gender: gender, word: word), "algimaz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .singular, gender: gender, word: word), "algī")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .plural, gender: gender, word: word), "algimiz")
    }
    
    func testFeminineIStemInflectionsForFurdiz() {
        let nounStem = NounStem.iStem
        let word = "furdiz"
        let gender = GrammaticalGender.feminine
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .singular, gender: gender, word: word), "furdiz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .plural, gender: gender, word: word), "furdīz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .singular, gender: gender, word: word), "furdi")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .plural, gender: gender, word: word), "furdīz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .singular, gender: gender, word: word), "furdį")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .plural, gender: gender, word: word), "furdinz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .singular, gender: gender, word: word), "furdīz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .plural, gender: gender, word: word), "furdijǫ̂")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .singular, gender: gender, word: word), "furdī")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .plural, gender: gender, word: word), "furdimaz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .singular, gender: gender, word: word), "furdī")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .plural, gender: gender, word: word), "furdimiz")
    }
    
    func testNeuterIStemInflectionsForFrōkni() {
        let nounStem = NounStem.iStem
        let word = "frōkni"
        let gender = GrammaticalGender.neuter
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .singular, gender: gender, word: word), "frōkni")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .plural, gender: gender, word: word), "frōknī")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .singular, gender: gender, word: word), "frōkni")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .plural, gender: gender, word: word), "frōknī")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .singular, gender: gender, word: word), "frōkni")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .plural, gender: gender, word: word), "frōknī")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .singular, gender: gender, word: word), "frōknīz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .plural, gender: gender, word: word), "frōknijǫ̂")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .singular, gender: gender, word: word), "frōknī")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .plural, gender: gender, word: word), "frōknimaz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .singular, gender: gender, word: word), "frōknī")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .plural, gender: gender, word: word), "frōknimiz")
    }
    
    func testMasculineUStemInflectionsForAnsuz() {
        let nounStem = NounStem.uStem
        let word = "ansuz"
        let gender = GrammaticalGender.masculine
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .singular, gender: gender, word: word), "ansuz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .plural, gender: gender, word: word), "ansiwiz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .singular, gender: gender, word: word), "ansu")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .plural, gender: gender, word: word), "ansiwiz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .singular, gender: gender, word: word), "ansų")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .plural, gender: gender, word: word), "ansunz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .singular, gender: gender, word: word), "ansauz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .plural, gender: gender, word: word), "ansiwǫ̂")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .singular, gender: gender, word: word), "ansiwi")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .plural, gender: gender, word: word), "ansumaz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .singular, gender: gender, word: word), "ansū")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .plural, gender: gender, word: word), "ansumiz")
    }
    
    func testFeminineUStemInflectionsForWeruz() {
        let nounStem = NounStem.uStem
        let word = "weruz"
        let gender = GrammaticalGender.feminine
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .singular, gender: gender, word: word), "weruz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .plural, gender: gender, word: word), "weriwiz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .singular, gender: gender, word: word), "weru")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .plural, gender: gender, word: word), "weriwiz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .singular, gender: gender, word: word), "werų")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .plural, gender: gender, word: word), "werunz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .singular, gender: gender, word: word), "werauz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .plural, gender: gender, word: word), "weriwǫ̂")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .singular, gender: gender, word: word), "weriwi")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .plural, gender: gender, word: word), "werumaz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .singular, gender: gender, word: word), "werū")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .plural, gender: gender, word: word), "werumiz")
    }
    
    func testNeuterUStemInflectionsForFehu() {
        let nounStem = NounStem.uStem
        let word = "fehu"
        let gender = GrammaticalGender.neuter
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .singular, gender: gender, word: word), "fehu")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .plural, gender: gender, word: word), "fehū")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .singular, gender: gender, word: word), "fehu")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .plural, gender: gender, word: word), "fehū")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .singular, gender: gender, word: word), "fehu")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .plural, gender: gender, word: word), "fehū")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .singular, gender: gender, word: word), "fehauz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .plural, gender: gender, word: word), "fehiwǫ̂")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .singular, gender: gender, word: word), "fehiwi")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .plural, gender: gender, word: word), "fehumaz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .singular, gender: gender, word: word), "fehū")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .plural, gender: gender, word: word), "fehumiz")
    }
    
    func testMasculineAnStemInflectionsForAtto() {
        let nounStem = NounStem.anStem
        let word = "attô"
        let gender = GrammaticalGender.masculine

        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .singular, gender: gender, word: word), "attô")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .plural, gender: gender, word: word), "attaniz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .singular, gender: gender, word: word), "attô")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .plural, gender: gender, word: word), "attaniz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .singular, gender: gender, word: word), "attanų")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .plural, gender: gender, word: word), "attanunz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .singular, gender: gender, word: word), "attiniz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .plural, gender: gender, word: word), "attanǫ̂")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .singular, gender: gender, word: word), "attini")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .plural, gender: gender, word: word), "attammaz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .singular, gender: gender, word: word), "attinē")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .plural, gender: gender, word: word), "attammiz")
    }
    
    func testNeuterAnStemInflectionsForHiwo() {
        let nounStem = NounStem.anStem
        let word = "hīwô"
        let gender = GrammaticalGender.neuter

        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .singular, gender: gender, word: word), "hīwô")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .plural, gender: gender, word: word), "hīwōnō")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .singular, gender: gender, word: word), "hīwô")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .plural, gender: gender, word: word), "hīwōnō")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .singular, gender: gender, word: word), "hīwô")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .plural, gender: gender, word: word), "hīwōnō")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .singular, gender: gender, word: word), "hīwiniz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .plural, gender: gender, word: word), "hīwanǫ̂")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .singular, gender: gender, word: word), "hīwini")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .plural, gender: gender, word: word), "hīwammaz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .singular, gender: gender, word: word), "hīwinē")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .plural, gender: gender, word: word), "hīwammiz")
    }
    
    func testOnStemInflectionsForKakō() {
        let nounStem = NounStem.onStem
        let word = "kakǭ"
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .singular, gender: .feminine, word: word), "kakǭ")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .plural, gender: .feminine, word: word), "kakōniz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .singular, gender: .feminine, word: word), "kakǭ")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .plural, gender: .feminine, word: word), "kakōniz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .singular, gender: .feminine, word: word), "kakōnų")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .plural, gender: .feminine, word: word), "kakōnunz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .singular, gender: .feminine, word: word), "kakōniz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .plural, gender: .feminine, word: word), "kakōnǫ̂")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .singular, gender: .feminine, word: word), "kakōni")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .plural, gender: .feminine, word: word), "kakōmaz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .singular, gender: .feminine, word: word), "kakōnē")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .plural, gender: .feminine, word: word), "kakōmiz")
    }
    
    func testInStemInflectionsForGramį̄() {
        let nounStem = NounStem.inStem
        let word = "gramį̄"
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .singular, gender: .feminine, word: word), "gramį̄")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .plural, gender: .feminine, word: word), "gramīniz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .singular, gender: .feminine, word: word), "gramį̄")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .plural, gender: .feminine, word: word), "gramīniz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .singular, gender: .feminine, word: word), "gramīnų")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .plural, gender: .feminine, word: word), "gramīnunz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .singular, gender: .feminine, word: word), "gramīniz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .plural, gender: .feminine, word: word), "gramīnǫ̂")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .singular, gender: .feminine, word: word), "gramīni")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .plural, gender: .feminine, word: word), "gramīmaz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .singular, gender: .feminine, word: word), "gramīnē")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .plural, gender: .feminine, word: word), "gramīmiz")
    }
    
    func testRStemInflectionsForFadēr() {
        let nounStem = NounStem.rStem
        let word = "fadēr"
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .singular, gender: .masculine, word: word), "fadēr")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .plural, gender: .masculine, word: word), "fadriz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .singular, gender: .masculine, word: word), "fadēr")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .plural, gender: .masculine, word: word), "fadriz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .singular, gender: .masculine, word: word), "faderų")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .plural, gender: .masculine, word: word), "fadrunz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .singular, gender: .masculine, word: word), "fadurz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .plural, gender: .masculine, word: word), "fadrǫ̂")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .singular, gender: .masculine, word: word), "fadri")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .plural, gender: .masculine, word: word), "fadrumaz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .singular, gender: .masculine, word: word), "fadrē")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .plural, gender: .masculine, word: word), "fadrumiz")
    }
    
    func testZStemInflectionsForHajaz() {
        let nounStem = NounStem.zStem
        let word = "hajaz"
        let root = NounInflectionService.extractBaseForm(from: word, gender: .masculine, stem: nounStem)

        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .singular, gender: .masculine, word: word), root + "az")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .plural, gender: .masculine, word: word), root + "izō")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .singular, gender: .masculine, word: word), root + "az")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .plural, gender: .masculine, word: word), root + "izō")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .singular, gender: .masculine, word: word), root + "az")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .plural, gender: .masculine, word: word), root + "izō")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .singular, gender: .masculine, word: word), root + "iziz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .plural, gender: .masculine, word: word), root + "izǫ̂")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .singular, gender: .masculine, word: word), root + "izi")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .plural, gender: .masculine, word: word), root + "izumaz")
        
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .singular, gender: .masculine, word: word), root + "izē")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .plural, gender: .masculine, word: word), root + "izumiz")
    }
    
    func testConsonantStemInflectionsForRiks() {
        let nounStem = NounStem.consonantStem
        let word = "rīks"
        let root = NounInflectionService.extractBaseForm(from: word, gender: .masculine, stem: nounStem)
        
        // Nominative
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .singular, gender: .masculine, word: word), root + "s")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .nominative, number: .plural, gender: .masculine, word: word), root + "iz")
        
        // Vocative
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .singular, gender: .masculine, word: word), root)
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .vocative, number: .plural, gender: .masculine, word: word), root + "iz")
        
        // Accusative
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .singular, gender: .masculine, word: word), root + "ų")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .accusative, number: .plural, gender: .masculine, word: word), root + "unz")
        
        // Genitive
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .singular, gender: .masculine, word: word), root + "iz")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .genitive, number: .plural, gender: .masculine, word: word), root + "ǫ̂")
        
        // Dative
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .singular, gender: .masculine, word: word), root + "i")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .dative, number: .plural, gender: .masculine, word: word), root + "umaz")
        
        // Instrumental
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .singular, gender: .masculine, word: word), root + "ē")
        XCTAssertEqual(NounInflectionService.inflect(nounStem: nounStem, grammaticalCase: .instrumental, number: .plural, gender: .masculine, word: word), root + "umiz")
    }

}
