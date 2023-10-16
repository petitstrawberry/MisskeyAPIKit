import Foundation
@testable import MisskeyAPIKit
import XCTest

public enum TestResources {
    public static let errorInvalidParam: URL = Bundle.module.url(
        forResource: "JSON/Responses/APIError/InvalidParam", withExtension: "json"
    )!
    public static let notesTimelineJSON: URL = Bundle.module.url(
        forResource: "JSON/Responses/Notes/Timeline", withExtension: "json"
    )!
    public static let notesCreateJSON: URL = Bundle.module.url(
        forResource: "JSON/Responses/Notes/Create", withExtension: "json"
    )!
    public static let driveFilesJSON: URL = Bundle.module.url(
        forResource: "JSON/Responses/Drive/Files", withExtension: "json"
    )!
    public static let driveFileCreateJSON: URL = Bundle.module.url(
        forResource: "JSON/Responses/Drive/Files/Create", withExtension: "json"
    )!
    public static let driveFilesUpdateJSON: URL = Bundle.module.url(
        forResource: "JSON/Responses/Drive/Files/Update", withExtension: "json"
    )!
    public static let driveFilesShowJSON: URL = Bundle.module.url(
        forResource: "JSON/Responses/Drive/Files/Show", withExtension: "json"
    )!
    public static let driveFilesExistsJSON: URL = Bundle.module.url(
        forResource: "JSON/Responses/Drive/Files/Exists", withExtension: "json"
    )!
    public static let driveFilesFindJSON: URL = Bundle.module.url(
        forResource: "JSON/Responses/Drive/Files/Find", withExtension: "json"
    )!
}
