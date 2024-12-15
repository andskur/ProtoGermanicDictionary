//
//  IrregularVerb.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 24/11/2024.
//

import Foundation

struct IrregularVerb {
    let baseForm: String
    let inflections: [GrammaticalTense: [GrammaticalMood: [GrammaticalNumber: [GrammaticalPerson: String]]]]
    let participles: [GrammaticalTense: String]
}

class IrregularVerbStore {
    static let shared = IrregularVerbStore()

    private init() {
        loadVerbs()
    }

    private var irregularVerbs: [String: IrregularVerb] = [:]

    func getVerb(baseForm: String) -> IrregularVerb? {
        return irregularVerbs[baseForm]
    }

    private func loadVerbs() {
        // Add irregular verbs here
        irregularVerbs["dōną"] = IrregularVerb(
            baseForm: "dōną",
            inflections: [
                .present: [
                    .indicative: [
                        .singular: [.first: "dōmi", .second: "dōsi", .third: "dōþi"],
                        .dual: [.first: "dōs", .second: "dōþiz"],
                        .plural: [.first: "dōmaz", .second: "dōþ", .third: "dōnþi"]
                    ],
                    .subjunctive: [
                        .singular: [.first: "dǭ", .second: "dōs", .third: "dō"],
                        .dual: [.first: "dōw", .second: "dōþiz"],
                        .plural: [.first: "dōm", .second: "dōþ", .third: "dōn"]
                    ],
                    .imperative: [
                        .singular: [.second: "dō", .third: "dōþau"],
                        .dual: [.second: "dōþiz"],
                        .plural: [.second: "dōþ", .third: "dōnþau"]
                    ]
                ],
                .past: [
                    .indicative: [
                        .singular: [.first: "dedǭ", .second: "dedēz", .third: "dedē"],
                        .dual: [.first: "dēdū", .second: "dēdudiz"],
                        .plural: [.first: "dēdum", .second: "dēdud", .third: "dēdun"]
                    ],
                    .subjunctive: [
                        .singular: [.first: "dēdį̄", .second: "dēdīz", .third: "dēdī"],
                        .dual: [.first: "dēdīw", .second: "dēdīdiz"],
                        .plural: [.first: "dēdīm", .second: "dēdīd", .third: "dēdīn"]
                    ]
                ]
            ],
            participles: [
                .present: "dōndz",
                .past: "dēnaz"
            ]
        )
        
        irregularVerbs["stāną"] = IrregularVerb(
            baseForm: "stāną",
            inflections: [
                .present: [
                    .indicative: [
                        .singular: [.first: "stō", .second: "staisi", .third: "staiþi"],
                        .dual: [.first: "stōs", .second: "stāþiz"],
                        .plural: [.first: "stāmaz", .second: "staiþ", .third: "stānþi"]
                    ],
                    .imperative: [
                        .singular: [.second: "stai", .third: "stāþau"],
                        .dual: [.second: "stāþiz"],
                        .plural: [.second: "staiþ", .third: "stānþau"]
                    ]
                ],
                .past: [
                    .indicative: [
                        .singular: [.first: "stōþ", .second: "stōst", .third: "stōþ"],
                        .dual: [.first: "stōdū", .second: "stōdudiz"],
                        .plural: [.first: "stōdum", .second: "stōdud", .third: "stōdun"]
                    ],
                    .subjunctive: [
                        .singular: [.first: "stōdį̄", .second: "stōdīz", .third: "stōdī"],
                        .dual: [.first: "stōdīw", .second: "stōdīdiz"],
                        .plural: [.first: "stōdīm", .second: "stōdīd", .third: "stōdīn"]
                    ]
                ]
            ],
            participles: [
                .present: "stāndz",
                .past: "stadanaz"
            ]
        )

        irregularVerbs["gāną"] = IrregularVerb(
            baseForm: "gāną",
            inflections: [
                .present: [
                    .indicative: [
                        .singular: [.first: "gō", .second: "gaisi", .third: "gaiþi"],
                        .dual: [.first: "gōs", .second: "gāþiz"],
                        .plural: [.first: "gāmaz", .second: "gaiþ", .third: "gānþi"]
                    ],
                    .imperative: [
                        .singular: [.second: "gai", .third: "gāþau"],
                        .dual: [.second: "gāþiz"],
                        .plural: [.second: "gaiþ", .third: "gānþau"]
                    ]
                ],
                .past: [
                    .indicative: [
                        .singular: [.first: "ijjǭ", .second: "ijjēz", .third: "ijjē"],
                        .dual: [.first: "ijjēdū", .second: "ijjēdudiz"],
                        .plural: [.first: "ijjēdum", .second: "ijjēdud", .third: "ijjēdun"]
                    ],
                    .subjunctive: [
                        .singular: [.first: "ijjēdį̄", .second: "ijjēdīz", .third: "ijjēdī"],
                        .dual: [.first: "ijjēdīw", .second: "ijjēdīdiz"],
                        .plural: [.first: "ijjēdīm", .second: "ijjēdīd", .third: "ijjēdīn"]
                    ]
                ]
            ],
            participles: [
                .present: "gāndz",
                .past: "gānaz"
            ]
        )

        irregularVerbs["aiganą"] = IrregularVerb(
            baseForm: "aiganą",
            inflections: [
                .present: [
                    .indicative: [
                        .singular: [.first: "aih", .second: "aiht", .third: "aih"],
                        .dual: [.first: "aigū", .second: "aigudiz"],
                        .plural: [.first: "aigum", .second: "aigud", .third: "aigun"]
                    ],
                    .subjunctive: [
                        .singular: [.first: "aigį̄", .second: "aigīz", .third: "aigī"],
                        .dual: [.first: "aigīw", .second: "aigīdiz"],
                        .plural: [.first: "aigīm", .second: "aigīd", .third: "aigīn"]
                    ]
                ],
                .past: [
                    .indicative: [
                        .singular: [.first: "aihtǭ", .second: "aihtēz", .third: "aihtē"],
                        .dual: [.first: "aihtēdū", .second: "aihtēdudiz"],
                        .plural: [.first: "aihtēdum", .second: "aihtēdud", .third: "aihtēdun"]
                    ],
                    .subjunctive: [
                        .singular: [.first: "aihtēdį̄", .second: "aihtēdīz", .third: "aihtēdī"],
                        .dual: [.first: "aihtēdīw", .second: "aihtēdīdiz"],
                        .plural: [.first: "aihtēdīm", .second: "aihtēdīd", .third: "aihtēdīn"]
                    ]
                ]
            ],
            participles: [
                .present: "aigandz",
                .past: "aiganaz"
            ]
        )

        irregularVerbs["wiljaną"] = IrregularVerb(
            baseForm: "wiljaną",
            inflections: [
                .present: [
                    .subjunctive: [
                        .singular: [.first: "wiljų", .second: "wilīz", .third: "wilī"],
                        .dual: [.first: "wilīw", .second: "wilīdiz"],
                        .plural: [.first: "wilīm", .second: "wilīd", .third: "wilīn"]
                    ]
                ],
                .past: [
                    .indicative: [
                        .singular: [.first: "weldǭ", .second: "weldēz", .third: "weldē"],
                        .dual: [.first: "weldēdū", .second: "weldēdudiz"],
                        .plural: [.first: "weldēdum", .second: "weldēdud", .third: "weldēdun"]
                    ],
                    .subjunctive: [
                        .singular: [.first: "weldēdį̄", .second: "weldēdīz", .third: "weldēdī"],
                        .dual: [.first: "weldēdīw", .second: "weldēdīdiz"],
                        .plural: [.first: "weldēdīm", .second: "weldēdīd", .third: "weldēdīn"]
                    ]
                ]
            ],
            participles: [
                .present: "wiljandz"
            ]
        )
        
        irregularVerbs["beuną"] = IrregularVerb(
            baseForm: "beuną",
            inflections: [
                .present: [
                    .indicative: [
                        .singular: [.first: "biumi", .second: "biusi", .third: "biuþi"],
                        .dual: [.first: "beū", .second: "biuþiz"],
                        .plural: [.first: "beum", .second: "beud", .third: "biunþi"]
                    ],
                    .subjunctive: [
                        .singular: [.first: "biwjǭ", .second: "biwjēs", .third: "biwjē"],
                        .dual: [.first: "biwīw", .second: "biwīþiz"],
                        .plural: [.first: "biwīm", .second: "biwīþ", .third: "biwīn"]
                    ],
                    .imperative: [
                        .singular: [.second: "beu", .third: "beuþau"],
                        .dual: [.second: "biudiz"],
                        .plural: [.second: "beuþ", .third: "beunþau"]
                    ]
                ],
                .past: [
                    .indicative: [
                        .singular: [.first: "was", .second: "wast", .third: "was"],
                        .dual: [.first: "wēzū", .second: "wēzudiz"],
                        .plural: [.first: "wēzum", .second: "wēzud", .third: "wēzun"]
                    ],
                    .subjunctive: [
                        .singular: [.first: "wēzį̄", .second: "wēzīz", .third: "wēzī"],
                        .dual: [.first: "wēzīw", .second: "wēzīdiz"],
                        .plural: [.first: "wēzīm", .second: "wēzīd", .third: "wēzīn"]
                    ]
                ]
            ],
            participles: [
                .present: "wesandz"
            ]
        )
        
        irregularVerbs["wesaną"] = IrregularVerb(
            baseForm: "wesaną",
            inflections: [
                .present: [
                    .indicative: [
                        .singular: [.first: "immi", .second: "izi", .third: "isti"],
                        .dual: [.first: "izū", .second: "izudiz"],
                        .plural: [.first: "izum", .second: "izud", .third: "sindi"]
                    ],
                    .subjunctive: [
                        .singular: [.first: "sijǭ", .second: "sijēs", .third: "sijē"],
                        .dual: [.first: "sīw", .second: "sīþiz"],
                        .plural: [.first: "sīm", .second: "sīþ", .third: "sīn"]
                    ],
                    .imperative: [
                        .singular: [.second: "wes", .third: "wesadau"],
                        .dual: [.second: "wesadiz"],
                        .plural: [.second: "wisid", .third: "wesandau"]
                    ]
                ],
                .past: [
                    .indicative: [
                        .singular: [.first: "was", .second: "wast", .third: "was"],
                        .dual: [.first: "wēzū", .second: "wēzudiz"],
                        .plural: [.first: "wēzum", .second: "wēzud", .third: "wēzun"]
                    ],
                    .subjunctive: [
                        .singular: [.first: "wēzį̄", .second: "wēzīz", .third: "wēzī"],
                        .dual: [.first: "wēzīw", .second: "wēzīdiz"],
                        .plural: [.first: "wēzīm", .second: "wēzīd", .third: "wēzīn"]
                    ]
                ]
            ],
            participles: [
                .present: "wesandz"
            ]
        )
    }
}
