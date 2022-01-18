
import UIKit

class EventProfileViewController: UIViewController {

    private let eventProfileView = EventProfileView()
    private let viewModel = EventProfileViewModel()

    private var event: EventViewData

    init(event: EventViewData) {
        self.event = event
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = eventProfileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        eventProfileView.eventName = event.title
        eventProfileView.eventPrice = String(event.price)
        eventProfileView.eventDescription = event.description
        setImage()
        dismissTapHandler()
    }

    private func setImage() {
        if event.image != "" {
            let urlString = event.image
            let imageEvent = viewModel.convertURLImage(url: urlString)
            eventProfileView.imageView.image = imageEvent
        }
    }

    private func dismissTapHandler() {
        eventProfileView.dismissButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }

    @objc func tapButton() {
        dismiss(animated: true, completion: nil)
    }
}
