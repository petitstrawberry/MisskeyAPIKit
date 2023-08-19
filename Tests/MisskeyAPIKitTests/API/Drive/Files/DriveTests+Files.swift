import Alamofire
@testable import MisskeyAPIKit
import Mocker
import XCTest

extension DriveTests {
    final class DriveTests: XCTestCase {
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

            let mock = try Mock(url: URL(string: baseURL + "/api/drive/files/create")!,
                                dataType: .json,
                                statusCode: 200,
                                data: [
                                    .post: Data(contentsOf: TestResources.driveFileCreateJSON),
                                ])
            mock.register()

            let createdFile = try await client.drive.files.create(
                .init(file: Data(contentsOf: TestResources.notesTimelineJSON), name: "test.txt", comment: "text file")
            ) { progress in
                print("fractionCompleted: \(progress.fractionCompleted)")
                print("completedUnitCount: \(progress.completedUnitCount)")
            }

            XCTAssertNotNil(createdFile)
        }
    }

    func testShow() async throws {
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self]
        let sessionManager = Alamofire.Session(configuration: configuration)

        let client = MisskeyAPI(
            baseURL: baseURL,
            credentials: .init(accessToken: "access_token"),
            session: sessionManager
        )

        let mock = try Mock(url: URL(string: baseURL + "/api/drive/files/show")!,
                            dataType: .json,
                            statusCode: 200,
                            data: [
                                .post: Data(contentsOf: TestResources.driveFilesShowJSON),
                            ])
        mock.register()

        let file = try await client.drive.files.show(
            .init(fileId: "9hltx1z3gq")
        )

        XCTAssertNotNil(file)
        XCTAssertEqual(file.id, "9hltx1z3gq")
    }
}
