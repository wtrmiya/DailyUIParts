import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

class PlaygroundViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
//        let textView = UITextView()
//        textView.isEditable = false
//        textView.isSelectable = true
//        textView.attributedText = createAttributedString()
//        view.addSubview(textView)
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            textView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            textView.widthAnchor.constraint(equalToConstant: 200),
//            textView.heightAnchor.constraint(equalToConstant: 50),
//        ])
    }
    
//    private func createAttributedString() -> NSAttributedString {
//        // code
//    }
}

PlaygroundPage.current.liveView = PlaygroundViewController()

