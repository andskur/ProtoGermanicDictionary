//
//  WiktionaryParser.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 02/11/2024.
//

import Foundation

class WiktionaryParser {

    static func parse(content: String) -> (translations: [String], wordType: WordType) {
        print(content)
        
        var translations: [String] = []
        var wordType: WordType = .unknown

        // Split the content into lines
        let lines = content.components(separatedBy: .newlines)

        var inProtoGermanicSection = false
        var inWordTypeSection = false

        for line in lines {
            let trimmedLine = line.trimmingCharacters(in: .whitespacesAndNewlines)

            // Check for language section header (exactly two equal signs)
            if isLanguageSectionHeader(line: trimmedLine) {
                let language = trimmedLine.replacingOccurrences(of: "^==\\s*(.*?)\\s*==$", with: "$1", options: .regularExpression)
                if language == "Proto-Germanic" {
                    inProtoGermanicSection = true
                } else {
                    inProtoGermanicSection = false
                }
                inWordTypeSection = false
                continue
            }

            if inProtoGermanicSection {
                // Check for word type section header (exactly three equal signs)
                if isWordTypeHeader(line: trimmedLine) {
                    let header = trimmedLine.replacingOccurrences(of: "^===\\s*(.*?)\\s*===$", with: "$1", options: .regularExpression)
                    if let detectedWordType = WordType(rawValue: header) {
                        wordType = detectedWordType
                        inWordTypeSection = true
                    } else {
                        inWordTypeSection = false
                    }
                    continue
                }

                if inWordTypeSection {
                    // Check for definitions starting with #
                    if trimmedLine.hasPrefix("#") {
                        var definition = trimmedLine
                        // Remove leading #'s and whitespace
                        definition = definition.replacingOccurrences(of: "^#+\\s*", with: "", options: .regularExpression)
                        // Remove wiki formatting
                        definition = removeWikiFormatting(from: definition)
                        if !definition.isEmpty {
                            translations.append(definition)
                        }
                    }
                }
            }
        }

        return (translations, wordType)
    }

    static func isLanguageSectionHeader(line: String) -> Bool {
        // Matches lines starting and ending with exactly two equal signs
        let pattern = "^==\\s*[^=]+\\s*==$"
        return line.range(of: pattern, options: .regularExpression) != nil
    }

    static func isWordTypeHeader(line: String) -> Bool {
        // Matches lines starting and ending with exactly three equal signs
        let pattern = "^===\\s*[^=]+\\s*===$"
        return line.range(of: pattern, options: .regularExpression) != nil
    }

    static func removeWikiFormatting(from text: String) -> String {
        var result = text
        // Remove bold/italics
        result = result.replacingOccurrences(of: "'''", with: "")
        result = result.replacingOccurrences(of: "''", with: "")
        // Remove links [[...]]
        result = result.replacingOccurrences(of: "\\[\\[([^\\]|]+)\\|([^\\]]+)\\]\\]", with: "$2", options: .regularExpression)
        result = result.replacingOccurrences(of: "\\[\\[([^\\]]+)\\]\\]", with: "$1", options: .regularExpression)
        // Remove templates {{...}}
        result = result.replacingOccurrences(of: "\\{\\{[^}]+\\}\\}", with: "", options: .regularExpression)
        // Remove references <ref>...</ref>
        result = result.replacingOccurrences(of: "<ref[^>]*>.*?<\\/ref>", with: "", options: .regularExpression)
        // Remove any remaining brackets and angle brackets
        result = result.replacingOccurrences(of: "[\\[\\]\\{\\}<>&]", with: "", options: .regularExpression)
        // Trim whitespace
        result = result.trimmingCharacters(in: .whitespacesAndNewlines)
        return result
    }
}
