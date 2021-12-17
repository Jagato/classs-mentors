//
//  ThreadDetailsViewController.swift
//  EducateMates
//
//  Created by John Nguyen on 12/17/21.
//

import UIKit
import Parse

class ThreadDetailsViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var threadTextView: UITextView!
    var thread: PFObject!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        titleLabel.text = thread["title"] as! String
        let user = thread["author"] as! PFUser
        let authorLabelText = "Authored by " + user.username!
        authorLabel.text = authorLabelText
        titleLabel.text = thread["title"] as! String
        threadTextView.text = thread["thread"] as! String
        // Do any additional setup after loading the view.
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
