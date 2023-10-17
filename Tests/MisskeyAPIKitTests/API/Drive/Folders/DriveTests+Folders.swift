import Alamofire
@testable import MisskeyAPIKit
import Mocker
import XCTest

extension DriveTests {
    final class FoldersTests: XCTestCase {
        let baseURL = "https://mi.example.com"

        func testCreate() async throws {
            let configuration = URLSessionConfiguration.af.default
            configuration.protocolClasses = [MockingURLProtocol.self]
            let sessionManager = Alamofire.Session(configuration: configuration)

            let client = MisskeyAPI(
                baseURL: baseURL,
                credentials: .init(accessToken: "access_token"),
                session: sessionManager
            )

            let mock = try Mock(url: URL(string: baseURL + "/api/drive/folders/create")!,
                                dataType: .json,
                                statusCode: 200,
                                data: [
                                    .post: Data(contentsOf: TestResources.driveFoldersCreateJSON),
                                ])
            mock.register()

            let folder = try await client.drive.folders.create(
                .init(name: "TEST")
            )

            XCTAssertNotNil(folder)
            XCTAssertEqual(folder.name, "TEST")
        }
    }
}