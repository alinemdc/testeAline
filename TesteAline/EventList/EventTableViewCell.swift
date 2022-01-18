

import UIKit

class EventTableViewCell: UITableViewCell {

    public var eventName: String {
        get { return name.text ?? "" }
        set { name.text = newValue }
    }

    public var eventPrice: String {
        get { return price.text ?? "" }
        set { price.text = "R$ \(newValue)" }
    }

    private var name: UILabel = {
       let label = UILabel()
        label.text = "Evento"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var price: UILabel = {
       let label = UILabel()
        label.text = "99,99"
        label.font = UIFont.italicSystemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addView()
        addConstraint()
    }

    private func addView() {
        addSubview(view)
        view.addSubview(stackView)
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(price)
    }

    private func addConstraint() {
        constraintView()
        constraintStackView()
        constraintEvent()
        constraintPrice()
    }

    private func constraintView() {
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

    private func constraintStackView() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func constraintEvent() {
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: stackView.leadingAnchor)
        ])
    }

    private func constraintPrice() {
        NSLayoutConstraint.activate([
            price.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            price.leadingAnchor.constraint(equalTo: stackView.leadingAnchor)
        ])
    }
}

extension EventTableViewCell {
    func configureAccessibility(_ event: EventViewData) {
        self.name.isAccessibilityElement = true
        self.price.isAccessibilityElement = true

        self.name.accessibilityLabel = "nome do evento"
        self.name.accessibilityValue = event.title

        self.price.accessibilityLabel = "valor do evento"
        self.price.accessibilityValue = String(event.price)

    }
}
