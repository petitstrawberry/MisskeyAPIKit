import Foundation

struct StreamingRequest: Codable {

    class Body: Codable {
        let channel: String?
        let id: String?
        let type: String?
        let body: Body?

        init(channel: String? = nil, id: String? = nil, type: String? = nil, body: Body? = nil) {
            self.channel = channel
            self.id = id
            self.type = type
            self.body = body
        }
    }

    let type: String
    let body: Body
}
