import Alamofire
@testable import MisskeyAPIKit
import Mocker
import XCTest

final class DriveTests: XCTestCase {
    let baseURL = "https://mi.example.com"

    func testGetFiles() async throws {
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self]
        let sessionManager = Alamofire.Session(configuration: configuration)

        let client = MisskeyAPI(
            baseURL: baseURL,
            credentials: .init(accessToken: "access_token"),
            session: sessionManager
        )

        let mock = try Mock(url: URL(string: baseURL + "/api/drive/files")!,
                            dataType: .json,
                            statusCode: 200,
                            data: [
                                .post: Data(contentsOf: TestResources.driveFilesJSON),
                            ])
        mock.register()

        let files = try await client.drive.getFiles(.init())
        XCTAssertNotNil(files)
    }
}
