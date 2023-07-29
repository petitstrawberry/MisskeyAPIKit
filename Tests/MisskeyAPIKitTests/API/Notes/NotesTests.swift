import Alamofire
@testable import MisskeyAPIKit
import Mocker
import XCTest

final class NotesTest: XCTestCase {
    let baseURL = "https://mi.example.com"

    // timeline
    func testGetTimeline() async throws {
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self]
        let sessionManager = Alamofire.Session(configuration: configuration)

        let client = MisskeyAPI(
            baseURL: baseURL,
            credentials: .init(accessToken: "access_token"),
            session: sessionManager
        )

        let mock = try Mock(url: URL(string: baseURL + "/api/notes/timeline")!,
                            dataType: .json,
                            statusCode: 200,
                            data: [
                                .post: Data(contentsOf: TestResources.notesTimelineJSON),
                            ])
        mock.register()

        let notes = try await client.notes.getTimeline(.init())

        XCTAssertNotNil(notes)
        // TODO: check notes
    }

    // createNote
    func testCreate() async throws {
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self]
        let sessionManager = Alamofire.Session(configuration: configuration)

        let client = MisskeyAPI(
            baseURL: baseURL,
            credentials: .init(accessToken: "access_token"),
            session: sessionManager
        )

        let mock = try Mock(url: URL(string: baseURL + "/api/notes/create")!,
                            dataType: .json,
                            statusCode: 200,
                            data: [
                                .post: Data(contentsOf: TestResources.notesCreateJSON),
                            ])
        mock.register()

        let createNote = try await client.notes.create(.init(text: "Hello, World!"))

        XCTAssertNotNil(createNote)
    }
}
