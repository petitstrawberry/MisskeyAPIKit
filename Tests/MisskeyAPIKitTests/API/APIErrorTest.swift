import Alamofire
@testable import MisskeyAPIKit
import Mocker
import XCTest

final class APIErrorTest: XCTestCase {
    let baseURL = "https://mi.example.com"

    // test BadRequest INVALID_PARAM
    func testBadRequest_INVALID_PARAM() async throws {
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
                            statusCode:
                            400,
                            data: [
                                .post: Data(contentsOf: TestResources.errorInvalidParam),
                            ])
        mock.register()

        var didFailWithError: Error?
        do {
            // This call is expected to fail
            _ = try await client.notes.getTimeline(.init(limit: -1))
        } catch {
            didFailWithError = error
            // Here you could do more assertions with the non-nil error object
        }

        XCTAssertNotNil(didFailWithError)
    }
}
