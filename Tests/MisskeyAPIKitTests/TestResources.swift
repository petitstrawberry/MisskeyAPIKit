import Foundation
@testable import MisskeyAPIKit
import XCTest

public enum TestResources {
    public static let notesTimelineJSON: URL = Bundle.module.url(
        forResource: "JSON/Responses/Notes/Timeline", withExtension: "json"
    )!
    public static let notesCreateJSON: URL = Bundle.module.url(
        forResource: "JSON/Responses/Notes/Create", withExtension: "json"
    )!
    public static let errorInvalidParam: URL = Bundle.module.url(
        forResource: "JSON/Responses/APIError/InvalidParam", withExtension: "json"
    )!
}
