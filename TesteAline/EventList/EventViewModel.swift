
import Foundation

final class EventViewModel: NSObject {

    public var reloadData: (() -> Void)?

    private var request: EventRequestProvider
    public var eventList = [EventViewData]() {
        didSet {
            reloadData?()
        }
    }

    init(
        request: EventRequestProvider = EventRequest()
    ) {
        self.request = request
    }

    public func execute() {
        request.getEvent { success, eventData, error in
            if success, let events = eventData {
                self.fetchData(events)
            } else {
                print(error ?? "Error")
            }
        }
    }

    private func fetchData(_ events: Events) {
        for event in events {
            eventList.append(eventListModel(event))
        }
    }

    private func eventListModel(_ event: Event) -> EventViewData {
        let eventData = EventViewData(
            people: event.people,
            date: event.date,
            description: event.description,
            image: event.image,
            longitude: event.longitude,
            latitude: event.latitude,
            price: event.price,
            title: event.title,
            id: event.id,
            cupons: event.cupons)

        return eventData
    }
}
