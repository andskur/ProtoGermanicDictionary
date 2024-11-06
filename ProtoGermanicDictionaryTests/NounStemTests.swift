//
//  NounStemTests.swift
//  ProtoGermanicDictionaryTests
//
//  Created by Andrey Skurlatov on 06/11/2024.
//

import XCTest
@testable import ProtoGermanicDictionary

class NounStemTests: XCTestCase {

    func testAStemMasculine() {
        let stemType = NounStem.detectStemType(nominativeSingular: "dagaz", gender: .masculine)
        XCTAssertEqual(stemType, .aStem, "Expected a-stem for masculine noun ending in 'az'")
    }
    
    func testAStemNeuter() {
        let stemType = NounStem.detectStemType(nominativeSingular: "baukną", gender: .neuter)
        XCTAssertEqual(stemType, .aStem, "Expected a-stem for neuter noun ending in 'a'")
    }
    
    func testJaStemMasculine() {
        let stemType = NounStem.detectStemType(nominativeSingular: "arnijaz", gender: .masculine)
        XCTAssertEqual(stemType, .jaStem, "Expected ja-stem for masculine noun ending in 'jaz'")
    }
    
    func testOStemFeminine() {
        let stemType = NounStem.detectStemType(nominativeSingular: "alinō", gender: .femenine)
        XCTAssertEqual(stemType, .oStem, "Expected ō-stem for feminine noun ending in 'ō'")
    }
    
    func testAnStemMasculine() {
        let stemType = NounStem.detectStemType(nominativeSingular: "hundan", gender: .masculine)
        XCTAssertEqual(stemType, .anStem, "Expected an-stem for masculine noun ending in 'an'")
    }
    
    func testOnStemFeminine() {
        let stemType = NounStem.detectStemType(nominativeSingular: "godōn", gender: .femenine)
        XCTAssertEqual(stemType, .onStem, "Expected ōn-stem for feminine noun ending in 'ōn'")
    }
    
    func testInStemFeminine() {
        let stemType = NounStem.detectStemType(nominativeSingular: "landīn", gender: .femenine)
        XCTAssertEqual(stemType, .inStem, "Expected īn-stem for feminine noun ending in 'īn'")
    }
    
    func testIStemMasculine() {
        let stemType = NounStem.detectStemType(nominativeSingular: "bandiz", gender: .masculine)
        XCTAssertEqual(stemType, .iStem, "Expected i-stem for masculine noun ending in 'iz'")
    }
    
    func testUStemMasculine() {
        let stemType = NounStem.detectStemType(nominativeSingular: "armuz", gender: .masculine)
        XCTAssertEqual(stemType, .uStem, "Expected u-stem for masculine noun ending in 'uz'")
    }
    
    func testRStem() {
        let stemType = NounStem.detectStemType(nominativeSingular: "fathēr", gender: .masculine)
        XCTAssertEqual(stemType, .rStem, "Expected r-stem for kinship term ending in 'r'")
    }
    
    func testZStem() {
        let stemType = NounStem.detectStemType(nominativeSingular: "skildz", gender: .masculine)
        XCTAssertEqual(stemType, .zStem, "Expected z-stem for masculine noun ending in 'z'")
    }
    
    func testConsonantStem() {
        let stemType = NounStem.detectStemType(nominativeSingular: "nahts", gender: .femenine)
        XCTAssertEqual(stemType, .consonantStem, "Expected consonant-stem for noun not ending in vowel-based suffixes")
    }
}
