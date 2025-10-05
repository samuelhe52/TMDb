//
//  TranslationsCollectionTests.swift
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
struct TranslationsCollectionTests {

    @Test("decode returns TranslationsCollection for movie")
    func decodeReturnsTranslationsCollectionForMovie() async throws {
        let result = try JSONDecoder.theMovieDatabase
            .decode(
                TranslationsCollection<Movie>.self,
                fromResource: "movie-translations"
            )

        #expect(result.id == 24428)
        #expect(result.translations[0].languageCode == "en")
        #expect(result.translations[0].countryCode == "US")
        #expect(result.translations[0].name == "English")
        #expect(result.translations[0].englishName == "English")
        #expect(result.translations[0].data.name == "The Avengers")
        #expect(result.translations[0].data.overview?.starts(with: "When an unexpected enemy") == true)
    }

    @Test("decode returns TranslationsCollection for TV series")
    func decodeReturnsTranslationsCollectionForTVSeries() async throws {
        let result = try JSONDecoder.theMovieDatabase
            .decode(
                TranslationsCollection<TVSeries>.self,
                fromResource: "tv-series-translations"
            )

        #expect(result.id == 1399)
        #expect(result.translations[0].languageCode == "en")
        #expect(result.translations[0].countryCode == "US")
        #expect(result.translations[0].name == "English")
        #expect(result.translations[0].englishName == "English")
        #expect(result.translations[0].data.name == "Game of Thrones")
        #expect(result.translations[0].data.overview?.starts(with: "Seven noble families") == true)
    }

}
