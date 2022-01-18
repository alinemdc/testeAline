
import UIKit

class EventView: UIView {

    public let eventTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupView() {
        addSubview(eventTableView)
        constraintEventTableView()
    }

    private func constraintEventTableView() {
        NSLayoutConstraint.activate([
            eventTableView.topAnchor.constraint(equalTo: topAnchor),
            eventTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            eventTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            eventTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
