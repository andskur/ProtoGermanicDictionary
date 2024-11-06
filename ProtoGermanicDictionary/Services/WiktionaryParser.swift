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
        var gender: NounGender? = nil
        var stem: String? = nil
    }

    static func parse(content: String) -> ParsedData {
//        print(content)
        
        var parsedData = ParsedData()
        var inProtoGermanicSection = false
        var inEtymologySection = false
        var inWordTypeSection = false

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
                if inEtymologySection && isWordTypeHeader(line: trimmedLine) {
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

                // Collect translations under word type sections
                if inEtymologySection && inWordTypeSection && trimmedLine.hasPrefix("#") {
                    var translationLine = trimmedLine
                    // Remove leading '#' characters and whitespace
                    translationLine = translationLine.replacingOccurrences(of: "^#+\\s*", with: "", options: .regularExpression)
                    // Clean up wiki formatting
                    translationLine = removeWikiFormatting(from: translationLine)
                    if !translationLine.isEmpty {
                        // Split multiple translations separated by ';' or ','
                        let splitTranslations = translationLine.components(separatedBy: CharacterSet(charactersIn: ";,")).map { $0.trimmingCharacters(in: .whitespaces) }
                        parsedData.translations.append(contentsOf: splitTranslations)
                    }
                }
            }
        }

        return parsedData
    }

    static func extractGender(from line: String) -> NounGender? {
        let pattern = #"\{\{gem-noun\|([mfn])\}\}"#
        if let genderCode = line.captures(for: pattern).first {
            switch genderCode {
            case "m": return NounGender.masculine
            case "f": return NounGender.femenine
            case "n": return NounGender.neuter
            default: return nil
            }
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
