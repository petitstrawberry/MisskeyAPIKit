import Foundation
import Starscream

private struct ConnectionRequest: Codable {

    enum RequestType: String, Codable {
        case connect
        case disconnect
    }

    struct Body: Codable {
        let channel: String?
        let id: String

        init(channel: String? = nil, id: String) {
            self.channel = channel
            self.id = id
        }
    }

    let type: RequestType
    let body: Body?
}

// protocol BaseChannel {
//     var client: StreamingClient { get }
//     var id: UUID { get }
//     var channel: String { get }

//     init(client: StreamingClient)

//     func connect()
//     func connect<T: BaseChannel>() -> T
//     func disconnect()
//     func didReceive(body: StreamingResponse.Body)
// }

public class BaseChannel {
    public let client: StreamingClient
    public var channel: String { fatalError("channel has not been implemented")}
    public let id: UUID = UUID()

    required init(client: StreamingClient) {
        self.client = client
    }

    func didReceive(body: StreamingResponse.Body) {
        fatalError("didReceive(body:) has not been implemented")
    }

    public func connect() -> Self {
        // default implementation
        let connectionRequest = ConnectionRequest(
            type: .connect, body: .init(channel: channel, id: id.uuidString)
        )

        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(connectionRequest)
            let json = String(data: data, encoding: .utf8)!
            client.write(string: json)
            client.subscribe(id: id, channel: self)
        } catch {
            print(error)
        }

        return self
    }

    public func disconnect() {
        // default implementation
        let connectionRequest = ConnectionRequest(
            type: .disconnect, body: .init(id: id.uuidString)
        )

        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(connectionRequest)
            let json = String(data: data, encoding: .utf8)!
            client.write(string: json)
            client.unsubscribe(id: id)
        } catch {
            print(error)
        }
    }
}