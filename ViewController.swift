
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var isFlashlightOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            toggleFlashlight()
        }
    }
    
    func toggleFlashlight() {
        guard let device = AVCaptureDevice.default(for: .video), device.hasTorch else {
            print("Flashlight not available")
            return
        }
        
        do {
            try device.lockForConfiguration()
            isFlashlightOn = !isFlashlightOn
            device.torchMode = isFlashlightOn ? .on : .off
            device.unlockForConfiguration()
        } catch {
            print("Failed to toggle flashlight: \(error)")
        }
    }
}
