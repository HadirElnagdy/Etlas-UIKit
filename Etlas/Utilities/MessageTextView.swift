import UIKit

class MessageTextView: UITextView {

    // MARK: - Properties

    let padding = UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 0)
    
    private let placeholderLabel: UILabel = UILabel()
    
    var placeholder: String? {
        didSet {
            placeholderLabel.text = placeholder
        }
    }

    // MARK: - Init

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        configureTextView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureTextView()
    }
    
    // MARK: - Private Methods
    
    private func configureTextView() {
        backgroundColor = UIColor(red: 0/255, green: 52/255, blue: 65/255, alpha: 1.0)
        layer.cornerRadius = 20
        clipsToBounds = true
        textColor = UIColor.white
        textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        font = UIFont.systemFont(ofSize: 14)
        isScrollEnabled = false
        textAlignment = .left
        autocapitalizationType = .sentences
        
        // Configure placeholder label
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.font = font
        placeholderLabel.numberOfLines = 0
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(placeholderLabel)

        NSLayoutConstraint.activate([
            placeholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: textContainerInset.left + textContainer.lineFragmentPadding),
            placeholderLabel.topAnchor.constraint(equalTo: topAnchor, constant: textContainerInset.top),
            placeholderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(textContainerInset.right + textContainer.lineFragmentPadding)),
            placeholderLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -textContainerInset.bottom)
        ])

        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: UITextView.textDidChangeNotification, object: self)
    }

    @objc private func textDidChange() {
        placeholderLabel.isHidden = !text.isEmpty
    }

    // MARK: - Text Container Inset Overrides

    override var textContainerInset: UIEdgeInsets {
        get {
            return padding
        }
        set {
            super.textContainerInset = newValue
        }
    }
}
