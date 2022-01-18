
import UIKit

final class EventViewController: UIViewController {

    public let eventView = EventView()
    private let viewModel = EventViewModel()

    init(){
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = eventView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        eventList()
    }

    private func eventList() {
        viewModel.execute()
        viewModel.reloadData = { [weak self] in
            DispatchQueue.main.async {
                self?.eventView.eventTableView.reloadData()
            }
        }
    }
}

extension EventViewController: UITableViewDelegate,UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.eventList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventTableViewCell

        let eventItem = viewModel.eventList[indexPath.row]
        cell.eventName = eventItem.title
        cell.eventPrice = String(eventItem.price)

        cell.configureAccessibility(eventItem)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eventItem = viewModel.eventList[indexPath.row]

        let viewController = EventProfileViewController(event: eventItem)
        show(viewController, sender: self)

    }

    private func setupTableView() {
        eventView.eventTableView.delegate = self
        eventView.eventTableView.dataSource = self
        eventView.eventTableView.register(EventTableViewCell.self, forCellReuseIdentifier: "eventCell")
    }
}
