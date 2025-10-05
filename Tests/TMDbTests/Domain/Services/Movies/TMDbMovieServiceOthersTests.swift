//
//  TMDbMovieServiceOthersTests.swift
//  TMDb
//
//  Copyright © 2025 Adam Young.
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

@Suite(.tags(.services, .movie))
struct TMDbMovieServiceOthersTests {

    var service: TMDbMovieService!
    var apiClient: MockAPIClient!

    init() {
        self.apiClient = MockAPIClient()
        self.service = TMDbMovieService(apiClient: apiClient)
    }

    @Test("watchProviders with default parameter values returns watch providers")
    func watchProvidersWithDefaultParameterValuesReturnsWatchProviders() async throws {
        let expectedResult = ShowWatchProviderResult.mock()
        let movieID = 1
        let country = "US"
        apiClient.addResponse(.success(expectedResult))
        let expectedRequest = MovieWatchProvidersRequest(id: movieID)

        let result = try await (service as MovieService).watchProviders(forMovie: movieID)

        #expect(result == expectedResult.results[country])
        #expect(apiClient.lastRequest as? MovieWatchProvidersRequest == expectedRequest)
    }

    @Test("watchProviders with country returns watch providers")
    func watchProvidersWithCountryReturnsWatchProviders() async throws {
        let expectedResult = ShowWatchProviderResult.mock()
        let movieID = 1
        let country = "GB"
        apiClient.addResponse(.success(expectedResult))
        let expectedRequest = MovieWatchProvidersRequest(id: movieID)

        let result = try await (service as MovieService).watchProviders(
            forMovie: movieID,
            country: country
        )

        #expect(result == expectedResult.results[country])
        #expect(apiClient.lastRequest as? MovieWatchProvidersRequest == expectedRequest)
    }

    @Test("watchProviders when errors throws error")
    func watchProvidersWhenErrorsThrowsError() async throws {
        let movieID = 1
        let country = "GB"
        apiClient.addResponse(.failure(.unknown))

        await #expect(throws: TMDbError.unknown) {
            _ = try await service.watchProviders(forMovie: movieID, country: country)
        }
    }

    @Test("extraLinks returns external links")
    func externalLinksReturnsExternalLinks() async throws {
        let expectedResult = MovieExternalLinksCollection.barbie
        let movieID = 346_698
        apiClient.addResponse(.success(expectedResult))
        let expectedRequest = MovieExternalLinksRequest(id: movieID)

        let result = try await service.externalLinks(forMovie: movieID)

        #expect(result == expectedResult)
        #expect(apiClient.lastRequest as? MovieExternalLinksRequest == expectedRequest)
    }

    @Test("extraLinks when errors throws error")
    func externalLinksWhenErrorsThrowsError() async throws {
        let movieID = 346_698
        apiClient.addResponse(.failure(.unknown))

        await #expect(throws: TMDbError.unknown) {
            _ = try await service.externalLinks(forMovie: movieID)
        }
    }

    @Test("translations returns translations collection")
    func translationsReturnsTranslationsCollection() async throws {
        let expectedResult = TranslationsCollection<Movie>.avengers
        let movieID = 24428
        apiClient.addResponse(.success(expectedResult))
        let expectedRequest = MovieTranslationsRequest(id: movieID)

        let result = try await service.translations(forMovie: movieID)

        #expect(result == expectedResult)
        #expect(apiClient.lastRequest as? MovieTranslationsRequest == expectedRequest)
    }

    @Test("translations when errors throws error")
    func translationsWhenErrorsThrowsError() async throws {
        let movieID = 24428
        apiClient.addResponse(.failure(.unknown))

        await #expect(throws: TMDbError.unknown) {
            _ = try await service.translations(forMovie: movieID)
        }
    }

}
