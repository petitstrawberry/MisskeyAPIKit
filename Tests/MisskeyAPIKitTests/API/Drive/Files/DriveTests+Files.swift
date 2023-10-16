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

    func testUpdate() async throws {
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self]
        let sessionManager = Alamofire.Session(configuration: configuration)

        let client = MisskeyAPI(
            baseURL: baseURL,
            credentials: .init(accessToken: "access_token"),
            session: sessionManager
        )

        let mock = try Mock(url: URL(string: baseURL + "/api/drive/files/update")!,
                            dataType: .json,
                            statusCode: 200,
                            data: [
                                .post: Data(contentsOf: TestResources.driveFilesUpdateJSON),
                            ])
        mock.register()

        let file = try await client.drive.files.update(
            .init(fileId: "9il5we0pk9", name: "foo.txt")
        )

        XCTAssertNotNil(file)
        XCTAssertEqual(file.id, "9il5we0pk9")
        XCTAssertEqual(file.name, "foo.txt")
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

    func testExists() async throws {
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self]
        let sessionManager = Alamofire.Session(configuration: configuration)

        let client = MisskeyAPI(
            baseURL: baseURL,
            credentials: .init(accessToken: "access_token"),
            session: sessionManager
        )

        let mock = try Mock(url: URL(string: baseURL + "/api/drive/files/check-existence")!,
                            dataType: .json,
                            statusCode: 200,
                            data: [
                                .post: Data(contentsOf: TestResources.driveFilesExistsJSON),
                            ])
        mock.register()

        let exists = try await client.drive.files.exists(
            .init(md5: "cc0007de11564fe8d979a0adf8d1b1b5")
        )

        XCTAssertTrue(exists)
    }

    func testFind() async throws {
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self]
        let sessionManager = Alamofire.Session(configuration: configuration)

        let client = MisskeyAPI(
            baseURL: baseURL,
            credentials: .init(accessToken: "access_token"),
            session: sessionManager
        )

        let mock = try Mock(url: URL(string: baseURL + "/api/drive/files/find")!,
                            dataType: .json,
                            statusCode: 200,
                            data: [
                                .post: Data(contentsOf: TestResources.driveFilesFindJSON),
                            ])
        mock.register()

        let found = try await client.drive.files.find(
            .init(name: "PNG image.png")
        )

        XCTAssert(found[0].name == "PNG image.png")
    }
}
