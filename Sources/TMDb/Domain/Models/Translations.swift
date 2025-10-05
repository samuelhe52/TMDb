//
//  Translations.swift
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

///
/// A model representing translations for an item.
/// 
public struct Translations: Codable, Equatable, Hashable, Sendable {
    
    ///
    /// The ISO 639-1 code of the language.
    ///
    public let iso639_1: String
    
    ///
    /// The ISO 3166-1 code of the country.
    ///
    public let iso3166_1: String
    
    ///
    /// The name of the language.
    ///
    public let name: String
    
    ///
    /// The English name of the language.
    ///
    public let englishName: String
    
    ///
    /// The translation data.
    ///
    public let data: TranslationData
}

extension Translations {
    private enum CodingKeys: String, CodingKey {
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case name
        case englishName = "english_name"
        case data = "data"
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
        
        let iso639_1 = try container.decode(String.self, forKey: .iso639_1)
        let iso3166_1 = try container.decode(String.self, forKey: .iso3166_1)
        let name = try container.decode(String.self, forKey: .name)
        let englishName = try container.decode(String.self, forKey: .englishName)
        let data = try container.decode(TranslationData.self, forKey: .data)
        
        self.init(
            iso639_1: iso639_1,
            iso3166_1: iso3166_1,
            name: name,
            englishName: englishName,
            data: data
        )
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
        
        try container.encode(iso639_1, forKey: .iso639_1)
        try container.encode(iso3166_1, forKey: .iso3166_1)
        try container.encode(name, forKey: .name)
        try container.encode(englishName, forKey: .englishName)
        try container.encode(data, forKey: .data)
    }
}

///
/// A model representing translation data for an item.
///
public struct TranslationData: Codable, Equatable, Hashable, Sendable {

    ///
    /// The title/name in the specified language.
    ///
    public let name: String?

    ///
    /// The overview in the specified language.
    ///
    public let overview: String?
}

extension TranslationData {
    private enum CodingKeys: String, CodingKey {
        case name
        case title
        case overview
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
        
        // Try to decode 'name' first, fall back to 'title' if not present
        let name = try container.decodeIfPresent(String.self, forKey: .name) 
            ?? container.decodeIfPresent(String.self, forKey: .title)
        let overview = try container.decodeIfPresent(String.self, forKey: .overview)
        
        self.init(name: name, overview: overview)
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
        
        // Encode as 'name' for consistency
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(overview, forKey: .overview)
    }
}
