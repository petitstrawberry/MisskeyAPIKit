@testable import MisskeyAPIKit
import XCTest

final class MisskeyAPIKitTests: XCTestCase {
    func testExample() async throws {
        // XCTest Documenation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
        let client = MisskeyAPI(baseURL: "https://mi.ichigo.dev")
        let notes = try await client.notes.getLocalTimeline(limit: 100)
        notes.forEach { _ in
        }
    }
}
