
import Foundation

protocol EventRequestProvider {
    func getEvent(_ completion: @escaping (Bool,Events?, String?) -> ())
}

class EventRequest: EventRequestProvider {
    private let url = URL(string: "https://5f5a8f24d44d640016169133.mockapi.io/api/events")
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func getEvent(_ completion: @escaping (Bool,Events?, String?) -> ()) {
        guard let url = url else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")

        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                do {
                    let eventData = try JSONDecoder().decode(Events.self, from: data!)
                    completion(true, eventData, nil)
                } catch {
                    completion(false, nil, "Error: Trying to parse Events")
                }
            }
        }.resume()
    }
}
