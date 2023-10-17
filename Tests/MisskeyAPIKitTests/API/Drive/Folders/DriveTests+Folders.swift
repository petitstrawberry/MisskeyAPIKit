import Alamofire
@testable import MisskeyAPIKit
import Mocker
import XCTest

extension DriveTests {
    final class FoldersTests: XCTestCase {
        let baseURL = "https://mi.example.com"

        // create
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

        // find
        func testFind() async throws {
            let configuration = URLSessionConfiguration.af.default
            configuration.protocolClasses = [MockingURLProtocol.self]
            let sessionManager = Alamofire.Session(configuration: configuration)

            let client = MisskeyAPI(
                baseURL: baseURL,
                credentials: .init(accessToken: "access_token"),
                session: sessionManager
            )

            let mock = try Mock(url: URL(string: baseURL + "/api/drive/folders/find")!,
                                dataType: .json,
                                statusCode: 200,
                                data: [
                                    .post: Data(contentsOf: TestResources.driveFolders1JSON),
                                ])
            mock.register()

            let folders = try await client.drive.folders.find(
                .init(name: "ai-chan")
            )

            XCTAssertNotNil(folders)
            XCTAssert(folders.allSatisfy({ $0.name == "ai-chan" }))
        }

        // show
        func testShow() async throws {
            let configuration = URLSessionConfiguration.af.default
            configuration.protocolClasses = [MockingURLProtocol.self]
            let sessionManager = Alamofire.Session(configuration: configuration)

            let client = MisskeyAPI(
                baseURL: baseURL,
                credentials: .init(accessToken: "access_token"),
                session: sessionManager
            )

            let mock = try Mock(url: URL(string: baseURL + "/api/drive/folders/show")!,
                                dataType: .json,
                                statusCode: 200,
                                data: [
                                    .post: Data(contentsOf: TestResources.driveFoldersShowJSON),
                                ])
            mock.register()

            let folder = try await client.drive.folders.show(
                .init(folderId: "9kx8eu003t")
            )

            XCTAssertNotNil(folder)
            XCTAssertEqual(folder.id, "9kx8eu003t")
        }

        // update
        func testUpdate() async throws {
            let configuration = URLSessionConfiguration.af.default
            configuration.protocolClasses = [MockingURLProtocol.self]
            let sessionManager = Alamofire.Session(configuration: configuration)

            let client = MisskeyAPI(
                baseURL: baseURL,
                credentials: .init(accessToken: "access_token"),
                session: sessionManager
            )

            let mock = try Mock(url: URL(string: baseURL + "/api/drive/folders/update")!,
                                dataType: .json,
                                statusCode: 200,
                                data: [
                                    .post: Data(contentsOf: TestResources.driveFoldersUpdateJSON),
                                ])
            mock.register()

            let folder = try await client.drive.folders.update(
                .init(folderId: "9kx8eu003t", name: "ai-chan")
            )

            XCTAssertNotNil(folder)
            XCTAssertEqual(folder.id, "9kx8eu003t")
            XCTAssertEqual(folder.name, "ai-chan-kawaii")
        }
    }
}