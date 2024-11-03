//
//  WiktionaryParserTests.swift
//  ProtoGermanicDictionaryTests
//
//  Created by Andrey Skurlatov on 02/11/2024.
//

import XCTest
@testable import ProtoGermanicDictionary // Replace with your actual module name

final class WiktionaryParserTests: XCTestCase {
    
    // MARK: - Test Single Etymology with One Word Type
    
    func testSingleEtymologySingleWordType() {
        let content = """
        ==Proto-Germanic==
        
        ===Etymology===
        {{unc|gem-pro}}<ref name="Bremmer">{{R:ofs:Bremmer:2009|201|bed|pages=33-34}}</ref>; possibly from {{inh|gem-pro|ine-pro||*bʰodʰh₂-yó-m|t=ditch, grave}}, from {{suf|ine-pro|*bʰedʰh₂-|t1=to dig, burrow; to pierce, stab|*yós|alt2=*yóm|nocat=1}}<ref name="EDPG" />, or perhaps from {{der|gem-pro|ine-pro||*bʰh₁-tó-s|t=warm}}, from {{suf|ine-pro|*bʰeh₁-|t1=to warm|*tós|nocat=1}}, whence {{m|gem-pro|*baþą|t=bath}}<ref name="Bremmer" />, {{cog|nl|betten|t=to warm up}}.
        
        ===Pronunciation===
        * {{IPA|gem-pro|/ˈbɑð.jɑ̃/}}
        
        ===Noun===
        {{gem-noun|n}}<ref name="EDPG">{{R:gem:EDPG|*badja-|46}}</ref>
        
        # dugout [[plot]] of [[ground]], [[grave]]
        # {{topics|gem-pro|Bedding|Furniture}}[[bed]]
        # [[bedding]]
        
        ====Inflection====
        {{gem-decl-noun}}
        
        ====Derived terms====
        * {{l|gem-pro|*badjô}}, {{l|gem-pro|*gabadjô}}
        * {{l|gem-pro|*badjǭ}}, {{l|gem-pro|*gabadjǭ}}
        
        ====Descendants====
        * {{desctree|gmw-pro|*badi}}
        * {{desctree|non|beðr|g=m|t=bolster, bedding}}
        * {{desc|got|𐌱𐌰𐌳𐌹}}
        * {{desc|bor=1|urj-fin-pro|*patja|t=pillow, mattress}} {{see desc}}
        
        ====Further reading====
        * {{cite-journal|year=2014|author=de Vaan, Michiel|chapter=West Germanic *þþ and *þm in Dutch|journal=Amsterdamer Beiträge zur älteren Germanistik|volume=72|pages=8-9|url=https://www.academia.edu/8085003/West_Germanic_%C3%BE%C3%BE_and_%C3%BEm_in_Dutch}}
        
        ===References===
        <references/>
        [[ru:*badją]]
        """
        
        let expectedWordType = WordType.noun
        let expectedTranslations = ["dugout plot of ground", "grave", "bed", "bedding"]
        
        let parsedData = WiktionaryParser.parse(content: content)
        
        XCTAssertEqual(parsedData.wordType, expectedWordType, "Word type should be Noun")
        XCTAssertEqual(parsedData.translations, expectedTranslations, "Translations should match expected values")
    }
    
    // MARK: - Test Single Etymology with Multiple Word Types
    
    func testSingleEtymologyMultipleWordTypes() {
        let content = """
        ==Proto-Germanic==
        
        ===Etymology===
        From {{inh|gem-pro|ine-pro|*h₂eng-|t=corner}} in sense "narrow meadow beside waterway".
        
        ===Noun===
        {{gem-noun|m}}<ref>{{R:gem:EDPG|*angra- 1|28}}</ref>
        
        # [[lowland]], [[meadow]]
        
        ===Verb===
        {{gem-verb|angr|present|past|past participle}}
        
        # [[to knead]]
        # [[to shape]]
        
        ===References===
        <references/>
        
        {{C|gem-pro|Landforms|Weevils}}
        """
        
        let expectedWordType = WordType.noun // Based on first word type
        let expectedTranslations = ["lowland", "meadow", "to knead", "to shape"]
        
        let parsedData = WiktionaryParser.parse(content: content)
        
        XCTAssertEqual(parsedData.wordType, expectedWordType, "Word type should be Noun")
        XCTAssertEqual(parsedData.translations, expectedTranslations, "Translations should include noun and verb definitions")
    }
    
    // MARK: - Test Multiple Etymologies Treated as Translations
    
    func testMultipleEtymologiesAsTranslations() {
        let content = """
        ==Proto-Germanic==
        
        ===Etymology 1===
        From {{inh|gem-pro|ine-pro|*h₂eng-|t=corner}} in sense "narrow meadow beside waterway".
        
        ====Noun====
        {{gem-noun|m}}<ref>{{R:gem:EDPG|*angra- 1|28}}</ref>
        
        # [[lowland]], [[meadow]]
        
        ===Etymology 2===
        A North-European word probably from or related to {{der|gem-pro|ine-pro|*h₂n̥gʷʰ-}}, variant of {{m|ine-pro|*h₂engʷʰ-}}, see also {{cog|la|anguis}}, {{cog|lt|angìs}}.
        
        ====Noun====
        {{gem-noun|m}}<ref>{{R:gem:EDPG|*angra- 2|28}}</ref>
        
        # [[weevil]]
        
        ===References===
        <references/>
        
        {{C|gem-pro|Landforms|Weevils}}
        """
        
        let expectedWordType = WordType.noun
        let expectedTranslations = ["lowland", "meadow", "weevil"]
        
        let parsedData = WiktionaryParser.parse(content: content)
        
        XCTAssertEqual(parsedData.wordType, expectedWordType, "Word type should be Noun")
        XCTAssertEqual(parsedData.translations, expectedTranslations, "Translations should include all definitions from multiple etymologies")
    }
    
    // MARK: - Test Entry with Complex Wiki Markup
    
    func testEntryWithComplexWikiMarkup() {
        let content = """
        ==Proto-Germanic==
        
        ===Etymology===
        {{unc|gem-pro}}<ref name="Bremmer">{{R:ofs:Bremmer:2009|201|bed|pages=33-34}}</ref>; possibly from {{inh|gem-pro|ine-pro||*bʰodʰh₂-yó-m|t=ditch, grave}}, from {{suf|ine-pro|*bʰedʰh₂-|t1=to dig, burrow; to pierce, stab|*yós|alt2=*yóm|nocat=1}}<ref name="EDPG" />, or perhaps from {{der|gem-pro|ine-pro||*bʰh₁-tó-s|t=warm}}, from {{suf|ine-pro|*bʰeh₁-|t1=to warm|*tós|nocat=1}}, whence {{m|gem-pro|*baþą|t=bath}}<ref name="Bremmer" />, {{cog|nl|betten|t=to warm up}}.
        
        ===Pronunciation===
        * {{IPA|gem-pro|/ˈbɑð.jɑ̃/}}
        
        ===Noun===
        {{gem-noun|n}}<ref name="EDPG">{{R:gem:EDPG|*badja-|46}}</ref>
        
        # dugout [[plot]] of [[ground]], [[grave]]
        # {{topics|gem-pro|Bedding|Furniture}}[[bed]]
        # [[bedding]]
        
        ====Inflection====
        {{gem-decl-noun}}
        
        ====Derived terms====
        * {{l|gem-pro|*badjô}}, {{l|gem-pro|*gabadjô}}
        * {{l|gem-pro|*badjǭ}}, {{l|gem-pro|*gabadjǭ}}
        
        ====Descendants====
        * {{desctree|gmw-pro|*badi}}
        * {{desctree|non|beðr|g=m|t=bolster, bedding}}
        * {{desc|got|𐌱𐌰𐌳𐌹}}
        * {{desc|bor=1|urj-fin-pro|*patja|t=pillow, mattress}} {{see desc}}
        
        ====Further reading====
        * {{cite-journal|year=2014|author=de Vaan, Michiel|chapter=West Germanic *þþ and *þm in Dutch|journal=Amsterdamer Beiträge zur älteren Germanistik|volume=72|pages=8-9|url=https://www.academia.edu/8085003/West_Germanic_%C3%BE%C3%BE_and_%C3%BEm_in_Dutch}}
        
        ===References===
        <references/>
        [[ru:*badją]]
        """
        
        let expectedWordType = WordType.noun
        let expectedTranslations = ["dugout plot of ground", "grave", "bed", "bedding"]
        
        let parsedData = WiktionaryParser.parse(content: content)
        
        XCTAssertEqual(parsedData.wordType, expectedWordType, "Word type should be Noun")
        XCTAssertEqual(parsedData.translations, expectedTranslations, "Translations should be cleaned and match expected values without wiki markup")
    }
    
    // MARK: - Test Entry with Missing Word Type
    
    // MARK: - Test Entry Without Proto-Germanic Section
    
    func testEntryWithoutProtoGermanicSection() {
        let content = """
        ==English==
        
        ===Etymology===
        From Old English [[angr]].
        
        ====Noun====
        {{eng-noun|m}}<ref>{{R:eng:Oxford|angr|28}}</ref>
        
        # [[anger]]
        
        ===References===
        <references/>
        """
        
        let expectedWordType = WordType.unknown
        let expectedTranslations: [String] = []
        
        let parsedData = WiktionaryParser.parse(content: content)
        
        XCTAssertEqual(parsedData.wordType, expectedWordType, "Word type should be Unknown when Proto-Germanic section is missing")
        XCTAssertEqual(parsedData.translations, expectedTranslations, "Translations should be empty when Proto-Germanic section is missing")
    }
    
    // MARK: - Test Entry with Multiple Word Types in Single Etymology
    
    func testEntryWithMultipleWordTypesInSingleEtymology() {
        let content = """
        ==Proto-Germanic==
        
        ===Etymology===
        From {{inh|gem-pro|ine-pro|*h₂eng-|t=corner}} in sense "narrow meadow beside waterway".
        
        ===Noun===
        {{gem-noun|m}}<ref>{{R:gem:EDPG|*angra- 1|28}}</ref>
        
        # [[lowland]], [[meadow]]
        
        ===Verb===
        {{gem-verb|angr|present|past|past participle}}
        
        # [[to knead]]
        # [[to shape]]
        
        ===References===
        <references/>
        
        {{C|gem-pro|Landforms|Weevils}}
        """
        
        let expectedWordType = WordType.noun // Based on first word type
        let expectedTranslations = ["lowland", "meadow", "to knead", "to shape"]
        
        let parsedData = WiktionaryParser.parse(content: content)
        
        XCTAssertEqual(parsedData.wordType, expectedWordType, "Word type should be Noun based on first word type")
        XCTAssertEqual(parsedData.translations, expectedTranslations, "Translations should include all definitions from multiple word types")
    }
    
    // MARK: - Test Entry with No Definitions
    
    func testEntryWithNoDefinitions() {
        let content = """
        ==Proto-Germanic==
        
        ===Etymology===
        From {{inh|gem-pro|ine-pro|*h₂eng-|t=corner}}.
        
        ===Noun===
        {{gem-noun|m}}<ref>{{R:gem:EDPG|*angra- 1|28}}</ref>
        
        ====Inflection====
        {{gem-decl-noun}}
        
        ===References===
        <references/>
        """
        
        let expectedWordType = WordType.noun
        let expectedTranslations: [String] = []
        
        let parsedData = WiktionaryParser.parse(content: content)
        
        XCTAssertEqual(parsedData.wordType, expectedWordType, "Word type should be Noun")
        XCTAssertEqual(parsedData.translations, expectedTranslations, "Translations should be empty when no definitions are provided")
    }
}
