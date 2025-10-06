//
//  TranslationsCollection.swift
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

///
/// A model representing a collection of translations for an item.
public struct TranslationsCollection<Item>: Identifiable, Codable, Equatable, Hashable, Sendable
where Item: Identifiable, Item.ID == Int {

    ///
    /// The TMDb item identifier.
    ///
    public let id: Item.ID

    ///
    /// The translations.
    ///
    public let translations: [Translations]

    ///
    /// Creates a translations collection for an item.
    ///
    /// - Parameters:
    ///   - id: The TMDb item identifier.
    ///   - translations: The translations.
    ///
    public init(id: Item.ID, translations: [Translations]) {
        self.id = id
        self.translations = translations
    }
}

extension TranslationsCollection {
    private enum CodingKeys: String, CodingKey {
        case id
        case translations = "translations"
    }

    ///
    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    ///
    /// - Throws: `DecodingError.typeMismatch` if the encountered encoded value is not convertible to the requested type.
    /// - Throws: `DecodingError.keyNotFound` if self does not have an entry for the given key.
    /// - Throws: `DecodingError.valueNotFound` if self has a null entry for the given key.
    ///
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(Item.ID.self, forKey: .id)
        let translations = try container.decode([Translations].self, forKey: .translations)

        self.init(id: id, translations: translations)
    }

    ///
    /// Encodes this value into the given encoder.
    ///
    /// If the value fails to encode anything, `encoder` will encode an empty
    /// keyed container in its place.
    ///
    /// This function throws an error if any values are invalid for the given
    /// encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    ///
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    ///
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(translations, forKey: .translations)
    }
}
