//
//  ProfileViewController.swift
//  EducateMates
//
//  Created by John Nguyen on 12/17/21.
//

import UIKit
import Parse

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var majorsLabel: UILabel!
    var users = [PFObject]()
    var threads = [PFObject]()
    let currentUser = PFUser.current()?.username as! String

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query1 = PFQuery(className:"User")
        query1.includeKey("username")
        query1.limit = 50
        query1.findObjectsInBackground { (users,error) in
            if users != nil {
                self.users = users!
                for user in self.users {
                    if user["username"] as! String == self.currentUser {
                        self.nameLabel.text = user["name"] as! String
                        self.schoolLabel.text = user["school"] as! String
                        self.majorsLabel.text = user["majorsminors"] as! String
                        self.bioTextView.text = user["bio"] as! String
                    }
                }
            }
        }
        
        
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query1 = PFQuery(className:"User")
        query1.includeKey("username")
        query1.limit = 50
        query1.findObjectsInBackground { (users,error) in
            if users != nil {
                self.users = users!
                for user in self.users {
                    if user["username"] as! String == self.currentUser {
                        self.nameLabel.text = user["name"] as! String
                        self.schoolLabel.text = user["school"] as! String
                        self.majorsLabel.text = user["majorsminors"] as! String
                        self.bioTextView.text = user["bio"] as! String
                    }
                }
            }
        }
        
        let query2 = PFQuery(className:"Threads")
        query2.whereKey("author", equalTo: currentUser)
        query2.findObjectsInBackground { (threads,error) in
            if threads != nil {
                print("found threads")
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
        let authorLabelText = "Authored by " + user.username!
        cell.authorLabel.text = authorLabelText
        cell.titleLabel.text = thread["title"] as! String
        cell.threadTextView.text = thread["thread"] as! String
        
        return cell
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "pushSegue")
        {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)!
            
            let thread = threads[indexPath.row]
            
            let detailsViewController = segue.destination as! ThreadDetailsViewController
            detailsViewController.thread = thread
            
            tableView.deselectRow(at: indexPath, animated: true)
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
