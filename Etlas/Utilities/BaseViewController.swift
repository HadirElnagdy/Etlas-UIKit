import UIKit

class BaseViewController: UIViewController, UITextFieldDelegate {
    
    private var keyboardAdjusted = false
    private var lastKeyboardOffset: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        registerKeyboardNotifications()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let activeTextField = findFirstResponder() else {
            return
        }
        
        let keyboardHeight = keyboardFrame.height
        
        if !(activeTextField is UITextView) {
            let textFieldFrameInWindow = activeTextField.convert(activeTextField.bounds, to: nil)
            let textFieldBottomY = textFieldFrameInWindow.origin.y + textFieldFrameInWindow.height
            
            let keyboardOverlap = textFieldBottomY - (view.frame.height - keyboardHeight)
            if keyboardOverlap > 0 {
                view.frame.origin.y = -keyboardOverlap
                keyboardAdjusted = true
                lastKeyboardOffset = keyboardOverlap
            }
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        if keyboardAdjusted {
            view.frame.origin.y += lastKeyboardOffset
            keyboardAdjusted = false
            lastKeyboardOffset = 0.0
        }
    }
    
    func findFirstResponder() -> UIView? {
        // Recursive function to find the first responder within the view hierarchy
        func findFirstResponder(in view: UIView) -> UIView? {
            if view.isFirstResponder {
                return view
            }
            
            for subview in view.subviews {
                if let firstResponder = findFirstResponder(in: subview) {
                    return firstResponder
                }
            }
            
            return nil
        }
        
        return findFirstResponder(in: view)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = ""
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }

}
