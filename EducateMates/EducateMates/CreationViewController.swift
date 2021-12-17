//
//  CreationViewController.swift
//  EducateMates
//
//  Created by John Nguyen on 12/17/21.
//

import UIKit
import Parse

class CreationViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var threadLabel: UILabel!
    @IBOutlet weak var threadTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        let thread = PFObject(className: "Threads")
        
        thread["title"] = titleTextField.text!
        thread["author"] = PFUser.current()!
        thread["thread"] = threadTextField.text!
        
        thread.saveInBackground { (success,error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("new thread posted!")
            } else {
                print("error in posting thread")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
