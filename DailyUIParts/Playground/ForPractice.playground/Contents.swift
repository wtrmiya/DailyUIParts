import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

class MySlider:UISlider {
    // 
}

class PlaygroundViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
    }
}

PlaygroundPage.current.liveView = PlaygroundViewController()

