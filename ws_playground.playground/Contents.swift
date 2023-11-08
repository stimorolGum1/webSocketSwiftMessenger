import Foundation

let session = URLSession(configuration: .default)

let url = URL(string: "ws://localhost:8765")!
var request = URLRequest(url: url)
request.addValue("websocket", forHTTPHeaderField: "Upgrade")
request.addValue("Upgrade", forHTTPHeaderField: "Connection")
let task = session.webSocketTask(with: request)
task.resume()
let message = URLSessionWebSocketTask.Message.string("Hello, server!")
task.send(message) { error in
    if let error = error {
        print("Error sending message: \(error)")
    }
}





