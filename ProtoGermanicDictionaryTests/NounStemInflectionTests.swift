//
//  NounStemInflectionTests.swift
//  ProtoGermanicDictionaryTests
//
//  Created by Andrey Skurlatov on 12/11/2024.
//


import XCTest
@testable import ProtoGermanicDictionary

class NounStemInflectionTests: XCTestCase {
    
    func testMasculineAStemInflections() {
        let nounStem = NounStem.aStem
        let word = "Dagaz" // Example masculine a-stem noun
        let gender = NounGender.masculine
        
        // Test cases for Dagaz (masculine a-stem)
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .singular, gender: gender, word: word), "Dagaz")
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .plural, gender: gender, word: word), "Dagōz")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .singular, gender: gender, word: word), "Dag")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .plural, gender: gender, word: word), "Dagōz")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .singular, gender: gender, word: word), "Dagą")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .plural, gender: gender, word: word), "Daganz")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .singular, gender: gender, word: word), "Dagas")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .plural, gender: gender, word: word), "Dagǫ̂")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .singular, gender: gender, word: word), "Dagai")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .plural, gender: gender, word: word), "Dagamaz")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .singular, gender: gender, word: word), "Dagō")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .plural, gender: gender, word: word), "Dagamiz")
    }
    
    func testNeuterAStemInflections() {
        let nounStem = NounStem.aStem
        let word = "Baką" // Example neuter a-stem noun
        let gender = NounGender.neuter
        
        // Test cases for Baką (neuter a-stem)
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .singular, gender: gender, word: word), "Baką")
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .plural, gender: gender, word: word), "Bakō")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .singular, gender: gender, word: word), "Baką")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .plural, gender: gender, word: word), "Bakō")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .singular, gender: gender, word: word), "Baką")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .plural, gender: gender, word: word), "Bakō")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .singular, gender: gender, word: word), "Bakas")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .plural, gender: gender, word: word), "Bakǫ̂")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .singular, gender: gender, word: word), "Bakai")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .plural, gender: gender, word: word), "Bakamaz")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .singular, gender: gender, word: word), "Bakō")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .plural, gender: gender, word: word), "Bakamiz")
    }

    // Test for ja-stem masculine noun "Harjaz"
    func testMasculineJaStemInflections() {
        let nounStem = NounStem.jaStem
        let word = "Harjaz" // Example masculine ja-stem noun
        let gender = NounGender.masculine
        
        // Test cases for Harjaz (masculine ja-stem)
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .singular, gender: gender, word: word), "Harjaz")
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .plural, gender: gender, word: word), "Harjōz")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .singular, gender: gender, word: word), "Hari")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .plural, gender: gender, word: word), "Harjōz")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .singular, gender: gender, word: word), "Harją")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .plural, gender: gender, word: word), "Harjanz")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .singular, gender: gender, word: word), "Harjas")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .plural, gender: gender, word: word), "Harjǫ̂")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .singular, gender: gender, word: word), "Harjai")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .plural, gender: gender, word: word), "Harjamaz")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .singular, gender: gender, word: word), "Harjō")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .plural, gender: gender, word: word), "Harjamiz")
    }
    
    // Test for ja-stem neuter noun "Abniją"
    func testNeuterJaStemInflections() {
        let nounStem = NounStem.jaStem
        let word = "Abniją" // Example neuter ja-stem noun
        let gender = NounGender.neuter

        // Test cases for Abniją (neuter ja-stem)
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .singular, gender: gender, word: word), "Abniją")
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .plural, gender: gender, word: word), "Abnijō")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .singular, gender: gender, word: word), "Abniją")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .plural, gender: gender, word: word), "Abnijō")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .singular, gender: gender, word: word), "Abniją")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .plural, gender: gender, word: word), "Abnijō")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .singular, gender: gender, word: word), "Abnijas")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .plural, gender: gender, word: word), "Abnijǫ̂")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .singular, gender: gender, word: word), "Abnijai")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .plural, gender: gender, word: word), "Abnijamaz")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .singular, gender: gender, word: word), "Abnijō")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .plural, gender: gender, word: word), "Abnijamiz")
    }
    
    
    // Test for o-stem feminine noun "frijō"
    func testFeminineOStemInflections() {
        let nounStem = NounStem.oStem
        let word = "frijō" // Example feminine o-stem noun
        let gender = NounGender.feminine
        
        // Test cases for frijō (feminine o-stem)
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .singular, gender: gender, word: word), "frijō")
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .plural, gender: gender, word: word), "frijôz")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .singular, gender: gender, word: word), "frijō")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .plural, gender: gender, word: word), "frijôz")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .singular, gender: gender, word: word), "frijǭ")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .plural, gender: gender, word: word), "frijōz")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .singular, gender: gender, word: word), "frijōz")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .plural, gender: gender, word: word), "frijǫ̂")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .singular, gender: gender, word: word), "frijōi")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .plural, gender: gender, word: word), "frijōmaz")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .singular, gender: gender, word: word), "frijō")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .plural, gender: gender, word: word), "frijōmiz")
    }
    
    // Test for ij-stem feminine noun "unþī"
    func testFeminineIjStemInflections() {
        let nounStem = NounStem.ijStem
        let word = "unþī" // Example feminine ij-stem noun
        let gender = NounGender.feminine
        
        // Test cases for unþī (feminine ij-stem)
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .singular, gender: gender, word: word), "unþī")
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .plural, gender: gender, word: word), "unþijôz")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .singular, gender: gender, word: word), "unþī")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .plural, gender: gender, word: word), "unþijôz")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .singular, gender: gender, word: word), "unþijǭ")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .plural, gender: gender, word: word), "unþijōz")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .singular, gender: gender, word: word), "unþijōz")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .plural, gender: gender, word: word), "unþijǫ̂")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .singular, gender: gender, word: word), "unþijōi")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .plural, gender: gender, word: word), "unþijōmaz")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .singular, gender: gender, word: word), "unþijō")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .plural, gender: gender, word: word), "unþijōmiz")
    }
}
