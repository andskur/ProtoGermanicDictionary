//
//  AdjectiveInflectionServiceTests.swift
//  ProtoGermanicDictionaryTests
//
//  Created by Andrey Skurlatov on 13/12/2024.
//

import XCTest
@testable import ProtoGermanicDictionary

final class AdjectiveInflectionServiceTests: XCTestCase {
    
    func testAStemInflections() {
        let adjectiveStem = "mikilaz"

        // Strong Masculine
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .nominative, number: .singular, gender: .masculine, decl: .strong, word: adjectiveStem), "mikilaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .nominative, number: .plural, gender: .masculine, decl: .strong, word: adjectiveStem), "mikilai")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .accusative, number: .singular, gender: .masculine, decl: .strong, word: adjectiveStem), "mikilanǭ")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .accusative, number: .plural, gender: .masculine, decl: .strong, word: adjectiveStem), "mikilanz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .genitive, number: .singular, gender: .masculine, decl: .strong, word: adjectiveStem), "mikilas")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .genitive, number: .plural, gender: .masculine, decl: .strong, word: adjectiveStem), "mikilaizǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .dative, number: .singular, gender: .masculine, decl: .strong, word: adjectiveStem), "mikilammai")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .dative, number: .plural, gender: .masculine, decl: .strong, word: adjectiveStem), "mikilaimaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .instrumental, number: .singular, gender: .masculine, decl: .strong, word: adjectiveStem), "mikilanō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .instrumental, number: .plural, gender: .masculine, decl: .strong, word: adjectiveStem), "mikilaimiz")

        // Strong Feminine
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .nominative, number: .singular, gender: .feminine, decl: .strong, word: adjectiveStem), "mikilō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .nominative, number: .plural, gender: .feminine, decl: .strong, word: adjectiveStem), "mikilôz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .accusative, number: .singular, gender: .feminine, decl: .strong, word: adjectiveStem), "mikilǭ")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .accusative, number: .plural, gender: .feminine, decl: .strong, word: adjectiveStem), "mikilōz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .genitive, number: .singular, gender: .feminine, decl: .strong, word: adjectiveStem), "mikilaizōz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .genitive, number: .plural, gender: .feminine, decl: .strong, word: adjectiveStem), "mikilaizǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .dative, number: .singular, gender: .feminine, decl: .strong, word: adjectiveStem), "mikilaizōi")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .dative, number: .plural, gender: .feminine, decl: .strong, word: adjectiveStem), "mikilaimaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .instrumental, number: .singular, gender: .feminine, decl: .strong, word: adjectiveStem), "mikilaizō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .instrumental, number: .plural, gender: .feminine, decl: .strong, word: adjectiveStem), "mikilaimiz")

        // Strong Neuter
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .nominative, number: .singular, gender: .neuter, decl: .strong, word: adjectiveStem), "mikilą")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .nominative, number: .plural, gender: .neuter, decl: .strong, word: adjectiveStem), "mikilō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .accusative, number: .singular, gender: .neuter, decl: .strong, word: adjectiveStem), "mikilą")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .accusative, number: .plural, gender: .neuter, decl: .strong, word: adjectiveStem), "mikilō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .genitive, number: .singular, gender: .neuter, decl: .strong, word: adjectiveStem), "mikilas")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .genitive, number: .plural, gender: .neuter, decl: .strong, word: adjectiveStem), "mikilaizǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .dative, number: .singular, gender: .neuter, decl: .strong, word: adjectiveStem), "mikilammai")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .dative, number: .plural, gender: .neuter, decl: .strong, word: adjectiveStem), "mikilaimaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .instrumental, number: .singular, gender: .neuter, decl: .strong, word: adjectiveStem), "mikilanō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .instrumental, number: .plural, gender: .neuter, decl: .strong, word: adjectiveStem), "mikilaimiz")
        
        // === Weak Declension ===

        // Weak Masculine
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .nominative, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "mikilô")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .nominative, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "mikilaniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .accusative, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "mikilanų")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .accusative, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "mikilanunz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .genitive, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "mikiliniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .genitive, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "mikilanǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .dative, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "mikilini")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .dative, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "mikilammaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .instrumental, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "mikilinē")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .instrumental, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "mikilammiz")
        // Weak Feminine
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .nominative, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "mikilǭ")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .nominative, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "mikilōniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .accusative, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "mikilōnų")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .accusative, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "mikilōnunz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .genitive, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "mikilōniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .genitive, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "mikilōnǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .dative, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "mikilōni")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .dative, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "mikilōmaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .instrumental, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "mikilōnē")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .instrumental, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "mikilōmiz")
        // Weak Neuter
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .nominative, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "mikilô")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .nominative, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "mikilōnō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .accusative, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "mikilô")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .accusative, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "mikilōnō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .genitive, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "mikiliniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .genitive, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "mikilanǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .dative, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "mikilini")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .dative, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem),"mikilammaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .instrumental, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "mikilinē")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .aStem, grammaticalCase: .instrumental, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "mikilammiz")
    }
    
    func testIStemInflections() {
        let adjectiveStem = "sēliz"

        // === Strong Declension ===

        // Strong Masculine
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .nominative, number: .singular, gender: .masculine, decl: .strong, word: adjectiveStem), "sēliz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .nominative, number: .plural, gender: .masculine, decl: .strong, word: adjectiveStem), "sēlijai")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .accusative, number: .singular, gender: .masculine, decl: .strong, word: adjectiveStem), "sēlijanǭ")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .accusative, number: .plural, gender: .masculine, decl: .strong, word: adjectiveStem), "sēlijanz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .genitive, number: .singular, gender: .masculine, decl: .strong, word: adjectiveStem), "sēlijas")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .genitive, number: .plural, gender: .masculine, decl: .strong, word: adjectiveStem), "sēlijaizǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .dative, number: .singular, gender: .masculine, decl: .strong, word: adjectiveStem), "sēlijammai")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .dative, number: .plural, gender: .masculine, decl: .strong, word: adjectiveStem), "sēlijaimaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .instrumental, number: .singular, gender: .masculine, decl: .strong, word: adjectiveStem), "sēlijanō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .instrumental, number: .plural, gender: .masculine, decl: .strong, word: adjectiveStem), "sēlijaimiz")

        // Strong Feminine
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .nominative, number: .singular, gender: .feminine, decl: .strong, word: adjectiveStem), "sēlī")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .nominative, number: .plural, gender: .feminine, decl: .strong, word: adjectiveStem), "sēlijôz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .accusative, number: .singular, gender: .feminine, decl: .strong, word: adjectiveStem), "sēlijǭ")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .accusative, number: .plural, gender: .feminine, decl: .strong, word: adjectiveStem), "sēlijōz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .genitive, number: .singular, gender: .feminine, decl: .strong, word: adjectiveStem), "sēlijaizōz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .genitive, number: .plural, gender: .feminine, decl: .strong, word: adjectiveStem), "sēlijaizǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .dative, number: .singular, gender: .feminine, decl: .strong, word: adjectiveStem), "sēlijaizōi")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .dative, number: .plural, gender: .feminine, decl: .strong, word: adjectiveStem), "sēlijaimaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .instrumental, number: .singular, gender: .feminine, decl: .strong, word: adjectiveStem), "sēlijaizō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .instrumental, number: .plural, gender: .feminine, decl: .strong, word: adjectiveStem), "sēlijaimiz")

        // Strong Neuter
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .nominative, number: .singular, gender: .neuter, decl: .strong, word: adjectiveStem), "sēlį")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .nominative, number: .plural, gender: .neuter, decl: .strong, word: adjectiveStem), "sēlijō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .accusative, number: .singular, gender: .neuter, decl: .strong, word: adjectiveStem), "sēlį")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .accusative, number: .plural, gender: .neuter, decl: .strong, word: adjectiveStem), "sēlijō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .genitive, number: .singular, gender: .neuter, decl: .strong, word: adjectiveStem), "sēlijas")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .genitive, number: .plural, gender: .neuter, decl: .strong, word: adjectiveStem), "sēlijaizǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .dative, number: .singular, gender: .neuter, decl: .strong, word: adjectiveStem), "sēlijammai")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .dative, number: .plural, gender: .neuter, decl: .strong, word: adjectiveStem), "sēlijaimaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .instrumental, number: .singular, gender: .neuter, decl: .strong, word: adjectiveStem), "sēlijanō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .instrumental, number: .plural, gender: .neuter, decl: .strong, word: adjectiveStem), "sēlijaimiz")

        // === Weak Declension ===

        // Weak Masculine
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .nominative, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "sēlijô")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .nominative, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "sēlijaniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .accusative, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "sēlijanų")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .accusative, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "sēlijanunz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .genitive, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "sēlīniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .genitive, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "sēlijanǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .dative, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "sēlīni")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .dative, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "sēlijammaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .instrumental, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "sēlīnē")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .instrumental, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "sēlijammiz")

        // Weak Feminine
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .nominative, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "sēlijǭ")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .nominative, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "sēlijōniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .accusative, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "sēlijōnų")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .accusative, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "sēlijōnunz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .genitive, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "sēlijōniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .genitive, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "sēlijōnǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .dative, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "sēlijōni")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .dative, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "sēlijōmaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .instrumental, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "sēlijōnē")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .instrumental, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "sēlijōmiz")

        // Weak Neuter
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .nominative, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "sēlijô")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .nominative, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "sēlijōnō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .accusative, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "sēlijô")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .accusative, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "sēlijōnō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .genitive, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "sēlīniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .genitive, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "sēlijanǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .dative, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "sēlīni")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .dative, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "sēlijammaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .instrumental, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "sēlīnē")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .iStem, grammaticalCase: .instrumental, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "sēlijammiz")
    }
    
    func testUStemInflections() {
        let adjectiveStem = "harduz"

        // === Strong Declension ===

        // Strong Masculine
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .nominative, number: .singular, gender: .masculine, decl: .strong, word: adjectiveStem), "harduz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .nominative, number: .plural, gender: .masculine, decl: .strong, word: adjectiveStem), "hardijai")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .accusative, number: .singular, gender: .masculine, decl: .strong, word: adjectiveStem), "hardijanǭ")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .accusative, number: .plural, gender: .masculine, decl: .strong, word: adjectiveStem), "hardijanz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .genitive, number: .singular, gender: .masculine, decl: .strong, word: adjectiveStem), "hardijas")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .genitive, number: .plural, gender: .masculine, decl: .strong, word: adjectiveStem), "hardijaizǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .dative, number: .singular, gender: .masculine, decl: .strong, word: adjectiveStem), "hardijammai")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .dative, number: .plural, gender: .masculine, decl: .strong, word: adjectiveStem), "hardijaimaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .instrumental, number: .singular, gender: .masculine, decl: .strong, word: adjectiveStem), "hardijanō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .instrumental, number: .plural, gender: .masculine, decl: .strong, word: adjectiveStem), "hardijaimiz")

        // Strong Feminine
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .nominative, number: .singular, gender: .feminine, decl: .strong, word: adjectiveStem), "hardī")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .nominative, number: .plural, gender: .feminine, decl: .strong, word: adjectiveStem), "hardijôz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .accusative, number: .singular, gender: .feminine, decl: .strong, word: adjectiveStem), "hardijǭ")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .accusative, number: .plural, gender: .feminine, decl: .strong, word: adjectiveStem), "hardijōz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .genitive, number: .singular, gender: .feminine, decl: .strong, word: adjectiveStem), "hardijaizōz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .genitive, number: .plural, gender: .feminine, decl: .strong, word: adjectiveStem), "hardijaizǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .dative, number: .singular, gender: .feminine, decl: .strong, word: adjectiveStem), "hardijaizōi")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .dative, number: .plural, gender: .feminine, decl: .strong, word: adjectiveStem), "hardijaimaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .instrumental, number: .singular, gender: .feminine, decl: .strong, word: adjectiveStem), "hardijaizō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .instrumental, number: .plural, gender: .feminine, decl: .strong, word: adjectiveStem), "hardijaimiz")

        // Strong Neuter
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .nominative, number: .singular, gender: .neuter, decl: .strong, word: adjectiveStem), "hardų")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .nominative, number: .plural, gender: .neuter, decl: .strong, word: adjectiveStem), "hardijō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .accusative, number: .singular, gender: .neuter, decl: .strong, word: adjectiveStem), "hardų")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .accusative, number: .plural, gender: .neuter, decl: .strong, word: adjectiveStem), "hardijō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .genitive, number: .singular, gender: .neuter, decl: .strong, word: adjectiveStem), "hardijas")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .genitive, number: .plural, gender: .neuter, decl: .strong, word: adjectiveStem), "hardijaizǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .dative, number: .singular, gender: .neuter, decl: .strong, word: adjectiveStem), "hardijammai")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .dative, number: .plural, gender: .neuter, decl: .strong, word: adjectiveStem), "hardijaimaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .instrumental, number: .singular, gender: .neuter, decl: .strong, word: adjectiveStem), "hardijanō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .instrumental, number: .plural, gender: .neuter, decl: .strong, word: adjectiveStem), "hardijaimiz")

        // === Weak Declension ===

        // Weak Masculine
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .nominative, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "hardijô")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .nominative, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "hardijaniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .accusative, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "hardijanų")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .accusative, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "hardijanunz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .genitive, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "hardīniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .genitive, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "hardijanǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .dative, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "hardīni")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .dative, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "hardijammaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .instrumental, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "hardīnē")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .instrumental, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "hardijammiz")
        
        // Weak Feminine
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .nominative, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "hardijǭ")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .nominative, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "hardijōniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .accusative, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "hardijōnų")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .accusative, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "hardijōnunz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .genitive, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "hardijōniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .genitive, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "hardijōnǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .dative, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "hardijōni")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .dative, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "hardijōmaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .instrumental, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "hardijōnē")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .instrumental, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "hardijōmiz")

        // Weak Neuter
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .nominative, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "hardijô")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .nominative, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "hardijōnō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .accusative, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "hardijô")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .accusative, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "hardijōnō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .genitive, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "hardīniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .genitive, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "hardijanǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .dative, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "hardīni")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .dative, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "hardijammaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .instrumental, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "hardīnē")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .uStem, grammaticalCase: .instrumental, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "hardijammiz")
    }
    
    func testNStemInflections() {
        let adjectiveStem = "flaizô"

        // === Weak Declension (n-stem) ===

        // Weak Masculine
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .nominative, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "flaizô")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .nominative, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "flaizaniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .accusative, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "flaizanų")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .accusative, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "flaizanunz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .genitive, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "flaiziniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .genitive, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "flaizanǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .dative, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "flaizini")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .dative, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "flaizammaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .instrumental, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "flaizinē")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .instrumental, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "flaizammiz")

        // Weak Feminine
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .nominative, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "flaizǭ")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .nominative, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "flaizōniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .accusative, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "flaizōnų")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .accusative, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "flaizōnunz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .genitive, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "flaizōniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .genitive, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "flaizōnǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .dative, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "flaizōni")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .dative, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "flaizōmaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .instrumental, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "flaizōnē")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .instrumental, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "flaizōmiz")

        // Weak Neuter
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .nominative, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "flaizô")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .nominative, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "flaizōnō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .accusative, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "flaizô")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .accusative, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "flaizōnō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .genitive, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "flaiziniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .genitive, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "flaizanǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .dative, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "flaizini")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .dative, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "flaizammaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .instrumental, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "flaizinē")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .nStem, grammaticalCase: .instrumental, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "flaizammiz")
    }

    func testANStemInflections() {
        let adjectiveStem = "ufumô"

        // === Weak Declension (an-stem) ===

        // Weak Masculine
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .nominative, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "ufumô")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .nominative, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "ufumaniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .accusative, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "ufumanų")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .accusative, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "ufumanunz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .genitive, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "ufuminiz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .genitive, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "ufumanǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .dative, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "ufumini")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .dative, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "ufumammaz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .instrumental, number: .singular, gender: .masculine, decl: .weak, word: adjectiveStem), "ufuminē")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .instrumental, number: .plural, gender: .masculine, decl: .weak, word: adjectiveStem), "ufumammiz")

        // Weak Feminine
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .nominative, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "ufumį̄")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .nominative, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "ufumīniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .accusative, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "ufumīnų")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .accusative, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "ufumīnunz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .genitive, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "ufumīniz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .genitive, number: .plural, gender: .feminine, decl: .weak, word: adjectiveStem), "ufumīnǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .dative, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "ufumīni")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .instrumental, number: .singular, gender: .feminine, decl: .weak, word: adjectiveStem), "ufumīnē")

        // Weak Neuter
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .nominative, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "ufumô")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .nominative, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "ufumōnō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .accusative, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "ufumô")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .accusative, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "ufumōnō")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .genitive, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "ufuminiz")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .genitive, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "ufumanǫ̂")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .dative, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "ufumini")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .instrumental, number: .singular, gender: .neuter, decl: .weak, word: adjectiveStem), "ufuminē")
        XCTAssertEqual(AdjectiveInflectionService.inflect(adjectiveStem: .inStem, grammaticalCase: .instrumental, number: .plural, gender: .neuter, decl: .weak, word: adjectiveStem), "ufumammiz")
    }
}
