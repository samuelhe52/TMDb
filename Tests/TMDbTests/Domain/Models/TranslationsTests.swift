//
//  TranslationsTests.swift
//  TMDb
//
//  Copyright © 2025 Adam Young.
//
//  Created by Samuel He on 2025/10/05.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an AS IS BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation
import Testing

@testable import TMDb

@Suite(.tags(.models))
struct TranslationsTests {

    @Test("JSON decoding of Translations", .tags(.decoding))
    func decodeTranslations() throws {
        let expectedResult = Translations(
            languageCode: "en",
            countryCode: "US",
            name: "English",
            englishName: "English",
            data: TranslationData(
                name: "The Avengers",
                overview: "When an unexpected enemy emerges..."
            )
        )

        let result = try JSONDecoder.theMovieDatabase.decode(
            Translations.self,
            fromResource: "translations"
        )

        #expect(result.languageCode == expectedResult.languageCode)
        #expect(result.countryCode == expectedResult.countryCode)
        #expect(result.name == expectedResult.name)
        #expect(result.englishName == expectedResult.englishName)
        #expect(result.data.name == expectedResult.data.name)
        #expect(result.data.overview == expectedResult.data.overview)
    }

    @Test("JSON decoding of Translations with title field", .tags(.decoding))
    func decodeTranslationsWithTitleField() throws {
        let expectedResult = Translations(
            languageCode: "fr",
            countryCode: "FR",
            name: "Français",
            englishName: "French",
            data: TranslationData(
                name: "Avengers",
                overview: "Lorsqu'un ennemi inattendu émerge..."
            )
        )

        let result = try JSONDecoder.theMovieDatabase.decode(
            Translations.self,
            fromResource: "translations-with-title"
        )

        #expect(result.languageCode == expectedResult.languageCode)
        #expect(result.countryCode == expectedResult.countryCode)
        #expect(result.name == expectedResult.name)
        #expect(result.englishName == expectedResult.englishName)
        #expect(result.data.name == expectedResult.data.name)
        #expect(result.data.overview == expectedResult.data.overview)
    }

}
