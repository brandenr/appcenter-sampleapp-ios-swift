
import UIKit
import AppCenterAnalytics

class CrashViewController: UIViewController {

    @IBOutlet weak var fatalErrorButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fatalErrorButton.layer.cornerRadius = 10.0

        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.isTranslucent = false
    }

    @IBAction func crashButtonTapped(_: UIButton) {
        presentCrashAlert()
    }

    // - MARK: Alert Functions
    func presentCrashAlert() {
        let alert = UIAlertController(title: "The app will close",
                                      message: "A crash report will be sent when you reopen the app.",
                                      preferredStyle: UIAlertControllerStyle.alert)

        // Cancel Button
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: UIAlertActionStyle.default,
                                      handler: { _ in alert.dismiss(animated: true, completion: nil)
        }))
        // Crash App button
        alert.addAction(UIAlertAction(title: "Memory Crash app",
                                      style: UIAlertActionStyle.destructive,
                                      handler: { _ in alert.dismiss(animated: true, completion: nil)
                                          // generate test crash
                                        MSAnalytics.trackEvent("Memory is about to run out")
                                        let giantString = NSMutableString()
                                        while true {
                                            giantString.append("\(giantString) a")
                                        }
        }))
        // Crash App button
        alert.addAction(UIAlertAction(title: "Crash app",
                                      style: UIAlertActionStyle.destructive,
                                      handler: { _ in alert.dismiss(animated: true, completion: nil)
                                        MSAnalytics.trackEvent("Optional about to crash")
                                        // generate test crash
                                        var view: UIView? = UIView()
                                        view = nil
                                        view!.removeFromSuperview()
        }))

        present(alert, animated: true, completion: nil)
    }
}
