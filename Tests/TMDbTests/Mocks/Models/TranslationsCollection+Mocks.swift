//
//  TranslationsCollection+Mocks.swift
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

@testable import TMDb

extension TranslationsCollection where Item == Movie {

    static var avengers: TranslationsCollection<Movie> {
        TranslationsCollection(
            id: 24428,
            translations: [
                Translations(
                    languageCode: "en",
                    countryCode: "US",
                    name: "English",
                    englishName: "English",
                    data: TranslationData(
                        name: "The Avengers",
                        overview: "When an unexpected enemy emerges..."
                    )
                ),
                Translations(
                    languageCode: "fr",
                    countryCode: "FR",
                    name: "Français",
                    englishName: "French",
                    data: TranslationData(
                        name: "Avengers",
                        overview: "Lorsqu'un ennemi inattendu émerge..."
                    )
                )
            ]
        )
    }

}

extension TranslationsCollection where Item == TVSeries {

    static var gameOfThrones: TranslationsCollection<TVSeries> {
        TranslationsCollection(
            id: 1399,
            translations: [
                Translations(
                    languageCode: "en",
                    countryCode: "US",
                    name: "English",
                    englishName: "English",
                    data: TranslationData(
                        name: "Game of Thrones",
                        overview: "Seven noble families fight for control..."
                    )
                ),
                Translations(
                    languageCode: "es",
                    countryCode: "ES",
                    name: "Español",
                    englishName: "Spanish",
                    data: TranslationData(
                        name: "Juego de tronos",
                        overview: "Siete nobles familias luchan por el control..."
                    )
                )
            ]
        )
    }

}

extension TranslationsCollection where Item == TVSeason {

    static var mock: TranslationsCollection<TVSeason> {
        TranslationsCollection(
            id: 1,
            translations: [
                Translations(
                    languageCode: "en",
                    countryCode: "US",
                    name: "English",
                    englishName: "English",
                    data: TranslationData(
                        name: "Season 1",
                        overview: "The first season..."
                    )
                )
            ]
        )
    }
}

extension TranslationsCollection where Item == TVEpisode {

    static var mock: TranslationsCollection<TVEpisode> {
        TranslationsCollection(
            id: 1,
            translations: [
                Translations(
                    languageCode: "en",
                    countryCode: "US",
                    name: "English",
                    englishName: "English",
                    data: TranslationData(
                        name: "Pilot",
                        overview: "The pilot episode..."
                    )
                )
            ]
        )
    }

}
