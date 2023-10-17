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

    func testGetFolders1() async throws {
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self]
        let sessionManager = Alamofire.Session(configuration: configuration)

        let client = MisskeyAPI(
            baseURL: baseURL,
            credentials: .init(accessToken: "access_token"),
            session: sessionManager
        )

        let mock = try Mock(url: URL(string: baseURL + "/api/drive/folders")!,
                            dataType: .json,
                            statusCode: 200,
                            data: [
                                .post: Data(contentsOf: TestResources.driveFolders1JSON),
                            ])
        mock.register()

        let folders = try await client.drive.getFolders(.init())
        XCTAssertNotNil(folders)
        XCTAssert(folders.allSatisfy({ $0.parentId == nil }))
    }

    func testGetFolders2() async throws {
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self]
        let sessionManager = Alamofire.Session(configuration: configuration)

        let client = MisskeyAPI(
            baseURL: baseURL,
            credentials: .init(accessToken: "access_token"),
            session: sessionManager
        )

        let mock = try Mock(url: URL(string: baseURL + "/api/drive/folders")!,
                            dataType: .json,
                            statusCode: 200,
                            data: [
                                .post: Data(contentsOf: TestResources.driveFolders2JSON),
                            ])
        mock.register()

        let folders = try await client.drive.getFolders(.init(folderId: "9kx8eu003t"))
        XCTAssertNotNil(folders)
        XCTAssert(folders.allSatisfy({ $0.parentId == "9kx8eu003t" }))
    }

    func testStream() async throws {
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self]
        let sessionManager = Alamofire.Session(configuration: configuration)

        let client = MisskeyAPI(
            baseURL: baseURL,
            credentials: .init(accessToken: "access_token"),
            session: sessionManager
        )

        let mock = try Mock(url: URL(string: baseURL + "/api/drive/stream")!,
                            dataType: .json,
                            statusCode: 200,
                            data: [
                                .post: Data(contentsOf: TestResources.driveStreamJSON),
                            ])
        mock.register()

        let stream = try await client.drive.stream(.init())
        XCTAssertNotNil(stream)
    }
}
