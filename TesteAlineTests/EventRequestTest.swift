import XCTest
@testable import TesteAline

class EventRequestTest: XCTestCase {
    var urlSession: URLSession!

    override func setUpWithError() throws {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: configuration)
    }

    func testGetEvent() throws {
        let eventAPI = EventRequest(session: urlSession)

        let sampleEventData = Event(people: [],
                                  date: 1534784400000,
                                  description: "teste",
                                  image: "",
                                  longitude: -51.2146267,
                                  latitude: -30.0392981,
                                  price: 29.99,
                                  title: "Teste",
                                  id: "1",
                                  cupons: [])

        let mockData = try JSONEncoder().encode(sampleEventData)


        MockURLProtocol.requestHandler = { request in
            return (HTTPURLResponse(), mockData)
        }

        let expectation = XCTestExpectation(description: "response")

        eventAPI.getEvent { success, eventData, error in
            
            XCTAssertEqual(eventData?[0].description, "teste")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
}
