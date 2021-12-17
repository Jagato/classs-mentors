//
//  FeedViewController.swift
//  EducateMates
//
//  Created by John Nguyen on 11/23/21.
//

import UIKit
import Parse

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var threads = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Threads")
        query.includeKey("author")
        
        query.limit = 50
        
        query.findObjectsInBackground { (threads, error) in
            if threads != nil {
                self.threads = threads!
                self.tableView.reloadData()
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threads.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThreadTableViewCell") as! ThreadTableViewCell
        
        let thread = threads[indexPath.row]
        let user = thread["author"] as! PFUser
        cell.authorLabel.text = user.username
        cell.titleLabel.text = thread["title"] as! String
        cell.threadTextView.text = thread["thread"] as! String
        
        return cell
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
