//
//  WiktionaryParser.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 02/11/2024.
//

import Foundation


class WiktionaryParser {

    struct ParsedData {
        var translations: [String] = []
        var wordType: WordType = .unknown
        var gender: GrammaticalGender? = nil
        var verbClass: VerbClass?
        var adjectiveStem: AdjectivesStem?
    }

    static func parse(content: String) -> ParsedData {
//        print(content)
        
        var parsedData = ParsedData()
        var inProtoGermanicSection = false
        var inEtymologySection = false
        var inWordTypeSection = false
        
        var verbClassSelected = false
        var adjectiveStemSelected = false

        // Split the content into lines
        let lines = content.components(separatedBy: .newlines)

        for (_, line) in lines.enumerated() {
            let trimmedLine = line.trimmingCharacters(in: .whitespacesAndNewlines)

            // Check for language section header (==Proto-Germanic==)
            if isLanguageSectionHeader(line: trimmedLine) {
                let language = extractLanguage(from: trimmedLine)
                inProtoGermanicSection = (language == "Proto-Germanic")
                inEtymologySection = false
                inWordTypeSection = false
                continue
            }

            
            if inProtoGermanicSection {
                // Check for etymology section header (===Etymology=== or ===Etymology 1===)
                if isEtymologySectionHeader(line: trimmedLine) {
                    inEtymologySection = true
                    inWordTypeSection = false

                    continue
                }
                
                // Check for word type section header (===Noun=== or ====Noun====)
                if isWordTypeHeader(line: trimmedLine) {
                    let header = extractWordType(from: trimmedLine)

                    // Attempt to map the extracted header to a WordType
                    if parsedData.wordType == .unknown, let detectedWordType = WordType(rawValue: header) {
                        parsedData.wordType = detectedWordType
                    }
                    inWordTypeSection = true
                    continue
                }

                // Extract gender if available in the line
                if let gender = extractGender(from: trimmedLine) {
                    parsedData.gender = gender
                }
                
                if inWordTypeSection && parsedData.wordType == .verb && !verbClassSelected {
                    if let (isStrong, verbClass) = detectVerbClass(from: trimmedLine) {                        
                        parsedData.verbClass = VerbClass.detectVerbClass(isStrong: isStrong, verbClass: verbClass)
                        verbClassSelected = true
                    }
                } else if inWordTypeSection && parsedData.wordType == .adjective && !adjectiveStemSelected {
                    if let stem = detectAdjectiveStem(from: trimmedLine) {
                        parsedData.adjectiveStem = stem
                        adjectiveStemSelected = true
                    }
                }
                
                // Collect translations under word type sections
                if inWordTypeSection && trimmedLine.hasPrefix("#") && !trimmedLine.hasSuffix("#:"){
                    var translationLine = trimmedLine
                    // Remove leading '#' characters and whitespace
                    translationLine = translationLine.replacingOccurrences(of: "^#+\\s*", with: "", options: .regularExpression)
                    // Clean up wiki formatting
                    translationLine = removeWikiFormatting(from: translationLine)
                    if !translationLine.isEmpty && !CharacterSet.punctuationCharacters.contains(translationLine.unicodeScalars.first!){
                        // Split multiple translations separated by ';' or ','
                        let splitTranslations = translationLine.components(separatedBy: CharacterSet(charactersIn: ";,")).map { $0.trimmingCharacters(in: .whitespaces) }
                                                
                        parsedData.translations.append(contentsOf: splitTranslations)
                    }
                }
            }
        }

        return parsedData
    }
    
    // Function to detect verb type and class
    static func detectVerbClass(from line: String) -> (isStrong: Bool, verbClass: String)? {
        // Pattern to capture strong verbs with class, e.g., {{gem-conj-st|class=7e|...}}
        let strongPattern = #"\{\{gem-conj-st\|class=(\w+)"#
        if let strongClass = line.captures(for: strongPattern).first {
            return (isStrong: true, verbClass: strongClass)
        }
        // Pattern to capture strong verbs with class, e.g., {{gem-conj-st|class=7e|...}}
        let strongPatternJ = #"\{\{gem-conj-st-j\|class=(\w+)"#
        if let strongClassJ = line.captures(for: strongPatternJ).first {
            return (isStrong: true, verbClass: strongClassJ)
        }

        // Pattern to capture weak verbs with class, e.g., {{gem-conj-wk1|...}}
        let weakPattern = #"\{\{gem-conj-wk(\d+)"#
        if let weakClass = line.captures(for: weakPattern).first {
            return (isStrong: false, verbClass: "wk\(weakClass)")
        }

        // Pattern to capture preterite-present verbs, e.g., {{gem-conj-pp|skul|skal|skuld}}
        let preteritePresentPattern = #"\{\{gem-conj-pp\|.*\}\}"#
        if line.range(of: preteritePresentPattern, options: .regularExpression) != nil {
            return (isStrong: false, verbClass: "Preterite-Present")
        }

        // Pattern to capture irregular verbs, e.g., {{gem-conj-irreg|...}}
        let irregularPattern = #"\{\{gem-conj-irreg\|.*\}\}"#
        if line.range(of: irregularPattern, options: .regularExpression) != nil {
            return (isStrong: false, verbClass: "Irregular")
        }

        // If no pattern is matched, return nil
        return nil
    }
    
    // Function to detect adjective stem
    static func detectAdjectiveStem(from line: String) -> AdjectivesStem? {
        let aPattern = #"\{\{gem-decl-adj-a\|.*\}\}"#
        if line.range(of: aPattern, options: .regularExpression) != nil {
            return AdjectivesStem.aStem
        }
        
        let iPattern = #"\{\{gem-decl-adj-i\|.*\}\}"#
        if line.range(of: iPattern, options: .regularExpression) != nil {
            return AdjectivesStem.iStem
        }

        let uPattern =  #"\{\{gem-decl-adj-u\|.*\}\}"#
        if line.range(of: uPattern, options: .regularExpression) != nil {
            return AdjectivesStem.uStem
        }

        let nPattern =  #"\{\{gem-decl-adj-n\|.*\}\}"#
        if line.range(of: nPattern, options: .regularExpression) != nil {
            return AdjectivesStem.nStem
        }

        let inPattern =  #"\{\{gem-decl-adj-in\|.*\}\}"#
        if line.range(of: inPattern, options: .regularExpression) != nil {
            return AdjectivesStem.inStem
        }

        return nil
    }

    static func extractGender(from line: String) -> GrammaticalGender? {
        let pattern = #"\{\{gem-noun\|([mfn])(\|head=[^}]*)?\}\}"#

        if let genderCode = line.captures(for: pattern).first {
            switch genderCode {
            case "m": return GrammaticalGender.masculine
            case "f": return GrammaticalGender.feminine
            case "n": return GrammaticalGender.neuter
            default:
                return nil
            }
        } else {
            
        }
        return nil
    }

    static func isLanguageSectionHeader(line: String) -> Bool {
        let pattern = "^==\\s*[^=]+?\\s*==$"
        return line.range(of: pattern, options: .regularExpression) != nil
    }

    static func extractLanguage(from line: String) -> String {
        let pattern = "^==\\s*([^=]+?)\\s*==$"
        if let match = line.captures(for: pattern).first {
            return match
        }
        return ""
    }

    static func isEtymologySectionHeader(line: String) -> Bool {
        let pattern = "^===\\s*Etymology(?:\\s*\\d+)?\\s*===$"
        return line.range(of: pattern, options: .regularExpression) != nil
    }

    static func isWordTypeHeader(line: String) -> Bool {
        let pattern = "^={3,4}\\s*[^=]+?\\s*={3,4}$"
        return line.range(of: pattern, options: .regularExpression) != nil
    }

    static func extractWordType(from line: String) -> String {
        let pattern = "^={3,4}\\s*([^=]+?)\\s*={3,4}$"
        if let match = line.captures(for: pattern).first {
            return match
        }
        return ""
    }

    static func removeWikiFormatting(from text: String) -> String {
        var result = text
        result = result.replacingOccurrences(of: "'''", with: "")
        result = result.replacingOccurrences(of: "''", with: "")
        result = result.replacingOccurrences(of: "\\[\\[([^\\]|]+)\\|([^\\]]+)\\]\\]", with: "$2", options: .regularExpression)
        result = result.replacingOccurrences(of: "\\[\\[([^\\]]+)\\]\\]", with: "$1", options: .regularExpression)
        result = result.replacingOccurrences(of: "\\{\\{[^}]+\\}\\}", with: "", options: .regularExpression)
        result = result.replacingOccurrences(of: "<ref[^>]*>.*?<\\/ref>", with: "", options: .regularExpression)
        result = result.replacingOccurrences(of: "[\\[\\]\\{\\}<>&]", with: "", options: .regularExpression)
        result = result.trimmingCharacters(in: .whitespacesAndNewlines)
        return result
    }
}


// MARK: - String Extension for Regex Captures

extension String {
    func captures(for regexPattern: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regexPattern)
            let nsRange = NSRange(self.startIndex..., in: self)
            if let match = regex.firstMatch(in: self, options: [], range: nsRange) {
                var results = [String]()
                for i in 1..<match.numberOfRanges {
                    let rangeBounds = match.range(at: i)
                    if let range = Range(rangeBounds, in: self) {
                        results.append(String(self[range]))
                    }
                }
                return results
            }
        } catch let error {
            print("Regex error: \(error)")
        }
        return []
    }
}
