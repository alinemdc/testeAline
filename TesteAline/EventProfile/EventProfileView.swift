

import UIKit

class EventProfileView: UIView {

    public var eventName: String {
        get { return name.text ?? ""}
        set { name.text =  newValue }
    }

    public var eventPrice: String {
        get { return price.text ?? ""}
        set { price.text =  "R$ \(newValue)" }
    }

    public var eventDescription: String {
        get { return descriptionText.text ?? ""}
        set { descriptionText.text =  newValue }
    }

    public var imageView: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "placeholder-image.png")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private var name: UILabel = {
        let name = UILabel()
        name.text = "Nome"
        name.textAlignment = .center
        name.numberOfLines = 2
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()

    private var price: UILabel = {
        let price = UILabel()
        price.text = "99,99"
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()

    private var descriptionText: UITextView = {
        let descriptionText = UITextView()
        descriptionText.text = "Texto"
        descriptionText.isEditable = false
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        return descriptionText
    }()

    public var dismissButton: UIButton = {
       let dismissButton = UIButton()
        dismissButton.setTitle("Ok", for: .normal)
        dismissButton.backgroundColor = .orange
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        return dismissButton
    }()

    private var view: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupView() {
        addView()
        addConstraint()
    }

    private func addView() {
        addSubview(view)
        view.addSubview(imageView)
        view.addSubview(name)
        view.addSubview(price)
        view.addSubview(descriptionText)
        view.addSubview(dismissButton)
    }

    private func addConstraint() {
        constraintView()
        constraintImage()
        constraintName()
        constraintPrice()
        constraintDescription()
        constraintDismissButton()
    }

    private func constraintView() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func constraintImage() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }

    private func constraintName() {
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            name.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            name.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func constraintPrice() {
        NSLayoutConstraint.activate([
            price.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20),
            price.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            price.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func constraintDescription() {
        NSLayoutConstraint.activate([
            descriptionText.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 20),
            descriptionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            descriptionText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionText.heightAnchor.constraint(equalToConstant: 250)
        ])
    }

    private func constraintDismissButton() {
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 30),
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
