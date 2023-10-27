public struct Notification: Codable {
    public let id: String?
    public let createdAt: String?
    // public let type: ActionType?
    public let userId: String?
    public let user: User?
    public let reaction: String?
    public let note: Note?
}