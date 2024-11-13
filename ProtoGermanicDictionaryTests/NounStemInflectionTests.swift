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
    
    func testMasculineIStemInflectionsForAlgiz() {
        let nounStem = NounStem.iStem
        let word = "algiz"
        let gender = NounGender.masculine
        
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .singular, gender: gender, word: word), "algiz")
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .plural, gender: gender, word: word), "algīz")
        
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .singular, gender: gender, word: word), "algi")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .plural, gender: gender, word: word), "algīz")
        
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .singular, gender: gender, word: word), "algį")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .plural, gender: gender, word: word), "alginz")
        
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .singular, gender: gender, word: word), "algīz")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .plural, gender: gender, word: word), "algijǫ̂")
        
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .singular, gender: gender, word: word), "algī")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .plural, gender: gender, word: word), "algimaz")
        
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .singular, gender: gender, word: word), "algī")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .plural, gender: gender, word: word), "algimiz")
    }
    
    func testFeminineIStemInflectionsForFurdiz() {
        let nounStem = NounStem.iStem
        let word = "furdiz"
        let gender = NounGender.feminine
        
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .singular, gender: gender, word: word), "furdiz")
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .plural, gender: gender, word: word), "furdīz")
        
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .singular, gender: gender, word: word), "furdi")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .plural, gender: gender, word: word), "furdīz")
        
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .singular, gender: gender, word: word), "furdį")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .plural, gender: gender, word: word), "furdinz")
        
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .singular, gender: gender, word: word), "furdīz")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .plural, gender: gender, word: word), "furdijǫ̂")
        
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .singular, gender: gender, word: word), "furdī")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .plural, gender: gender, word: word), "furdimaz")
        
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .singular, gender: gender, word: word), "furdī")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .plural, gender: gender, word: word), "furdimiz")
    }
    
    func testNeuterIStemInflectionsForFrōkni() {
        let nounStem = NounStem.iStem
        let word = "frōkni"
        let gender = NounGender.neuter
        
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .singular, gender: gender, word: word), "frōkni")
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .plural, gender: gender, word: word), "frōknī")
        
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .singular, gender: gender, word: word), "frōkni")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .plural, gender: gender, word: word), "frōknī")
        
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .singular, gender: gender, word: word), "frōkni")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .plural, gender: gender, word: word), "frōknī")
        
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .singular, gender: gender, word: word), "frōknīz")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .plural, gender: gender, word: word), "frōknijǫ̂")
        
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .singular, gender: gender, word: word), "frōknī")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .plural, gender: gender, word: word), "frōknimaz")
        
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .singular, gender: gender, word: word), "frōknī")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .plural, gender: gender, word: word), "frōknimiz")
    }
    
    func testMasculineUStemInflectionsForAnsuz() {
        let nounStem = NounStem.uStem
        let word = "ansuz"
        let gender = NounGender.masculine
        
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .singular, gender: gender, word: word), "ansuz")
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .plural, gender: gender, word: word), "ansiwiz")
        
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .singular, gender: gender, word: word), "ansu")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .plural, gender: gender, word: word), "ansiwiz")
        
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .singular, gender: gender, word: word), "ansų")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .plural, gender: gender, word: word), "ansunz")
        
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .singular, gender: gender, word: word), "ansauz")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .plural, gender: gender, word: word), "ansiwǫ̂")
        
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .singular, gender: gender, word: word), "ansiwi")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .plural, gender: gender, word: word), "ansumaz")
        
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .singular, gender: gender, word: word), "ansū")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .plural, gender: gender, word: word), "ansumiz")
    }
    
    func testFeminineUStemInflectionsForWeruz() {
        let nounStem = NounStem.uStem
        let word = "weruz"
        let gender = NounGender.feminine
        
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .singular, gender: gender, word: word), "weruz")
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .plural, gender: gender, word: word), "weriwiz")
        
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .singular, gender: gender, word: word), "weru")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .plural, gender: gender, word: word), "weriwiz")
        
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .singular, gender: gender, word: word), "werų")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .plural, gender: gender, word: word), "werunz")
        
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .singular, gender: gender, word: word), "werauz")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .plural, gender: gender, word: word), "weriwǫ̂")
        
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .singular, gender: gender, word: word), "weriwi")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .plural, gender: gender, word: word), "werumaz")
        
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .singular, gender: gender, word: word), "werū")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .plural, gender: gender, word: word), "werumiz")
    }
    
    func testNeuterUStemInflectionsForFehu() {
        let nounStem = NounStem.uStem
        let word = "fehu"
        let gender = NounGender.neuter
        
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .singular, gender: gender, word: word), "fehu")
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .plural, gender: gender, word: word), "fehū")
        
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .singular, gender: gender, word: word), "fehu")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .plural, gender: gender, word: word), "fehū")
        
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .singular, gender: gender, word: word), "fehu")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .plural, gender: gender, word: word), "fehū")
        
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .singular, gender: gender, word: word), "fehauz")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .plural, gender: gender, word: word), "fehiwǫ̂")
        
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .singular, gender: gender, word: word), "fehiwi")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .plural, gender: gender, word: word), "fehumaz")
        
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .singular, gender: gender, word: word), "fehū")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .plural, gender: gender, word: word), "fehumiz")
    }
    
    func testMasculineAnStemInflectionsForAtto() {
        let nounStem = NounStem.anStem
        let word = "attô"
        let gender = NounGender.masculine

        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .singular, gender: gender, word: word), "attô")
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .plural, gender: gender, word: word), "attaniz")
        
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .singular, gender: gender, word: word), "attô")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .plural, gender: gender, word: word), "attaniz")
        
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .singular, gender: gender, word: word), "attanų")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .plural, gender: gender, word: word), "attanunz")
        
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .singular, gender: gender, word: word), "attiniz")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .plural, gender: gender, word: word), "attanǫ̂")
        
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .singular, gender: gender, word: word), "attini")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .plural, gender: gender, word: word), "attammaz")
        
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .singular, gender: gender, word: word), "attinē")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .plural, gender: gender, word: word), "attammiz")
    }
    
    func testNeuterAnStemInflectionsForHiwo() {
        let nounStem = NounStem.anStem
        let word = "hīwô"
        let gender = NounGender.neuter

        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .singular, gender: gender, word: word), "hīwô")
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .plural, gender: gender, word: word), "hīwōnō")
        
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .singular, gender: gender, word: word), "hīwô")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .plural, gender: gender, word: word), "hīwōnō")
        
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .singular, gender: gender, word: word), "hīwô")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .plural, gender: gender, word: word), "hīwōnō")
        
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .singular, gender: gender, word: word), "hīwiniz")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .plural, gender: gender, word: word), "hīwanǫ̂")
        
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .singular, gender: gender, word: word), "hīwini")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .plural, gender: gender, word: word), "hīwammaz")
        
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .singular, gender: gender, word: word), "hīwinē")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .plural, gender: gender, word: word), "hīwammiz")
    }
    
    func testOnStemInflectionsForKakō() {
        let nounStem = NounStem.onStem
        let word = "kakǭ"
        
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .singular, gender: .feminine, word: word), "kakǭ")
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .plural, gender: .feminine, word: word), "kakōniz")
        
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .singular, gender: .feminine, word: word), "kakǭ")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .plural, gender: .feminine, word: word), "kakōniz")
        
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .singular, gender: .feminine, word: word), "kakōnų")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .plural, gender: .feminine, word: word), "kakōnunz")
        
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .singular, gender: .feminine, word: word), "kakōniz")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .plural, gender: .feminine, word: word), "kakōnǫ̂")
        
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .singular, gender: .feminine, word: word), "kakōni")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .plural, gender: .feminine, word: word), "kakōmaz")
        
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .singular, gender: .feminine, word: word), "kakōnē")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .plural, gender: .feminine, word: word), "kakōmiz")
    }
    
    func testInStemInflectionsForGramį̄() {
        let nounStem = NounStem.inStem
        let word = "gramį̄"
        
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .singular, gender: .feminine, word: word), "gramį̄")
        XCTAssertEqual(nounStem.inflection(for: .nominative, number: .plural, gender: .feminine, word: word), "gramīniz")
        
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .singular, gender: .feminine, word: word), "gramį̄")
        XCTAssertEqual(nounStem.inflection(for: .vocative, number: .plural, gender: .feminine, word: word), "gramīniz")
        
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .singular, gender: .feminine, word: word), "gramīnų")
        XCTAssertEqual(nounStem.inflection(for: .accusative, number: .plural, gender: .feminine, word: word), "gramīnunz")
        
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .singular, gender: .feminine, word: word), "gramīniz")
        XCTAssertEqual(nounStem.inflection(for: .genitive, number: .plural, gender: .feminine, word: word), "gramīnǫ̂")
        
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .singular, gender: .feminine, word: word), "gramīni")
        XCTAssertEqual(nounStem.inflection(for: .dative, number: .plural, gender: .feminine, word: word), "gramīmaz")
        
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .singular, gender: .feminine, word: word), "gramīnē")
        XCTAssertEqual(nounStem.inflection(for: .instrumental, number: .plural, gender: .feminine, word: word), "gramīmiz")
    }
}
