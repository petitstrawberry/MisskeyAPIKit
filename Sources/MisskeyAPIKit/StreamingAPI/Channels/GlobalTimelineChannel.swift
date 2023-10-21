import Foundation
import Starscream

public class GlobalTimelineChannel: BaseChannel {
    override public var channel: String { "globalTimeline" }

    override func didReceive(body: StreamingResponse.Body) {
        switch body.type {
        case .note:
            do {
                let decoder = JSONDecoder()
                let data = try JSONSerialization.data(withJSONObject: body.body!, options: [])
                let note = try decoder.decode(MisskeyAPIKit.Note.self, from: data)
                self.onReceiveNote?(note)
            } catch {
                print(error)
            }
        default:
            break
        }
    }

    var onReceiveNote: ((MisskeyAPIKit.Note) -> Void)?
    public func onReceiveNote(_ completion: @escaping (MisskeyAPIKit.Note) -> Void) -> Self {
        onReceiveNote = completion
        return self
    }
}