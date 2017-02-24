//
//  ChatViewController.swift
//  Chatter
//
//  Created by Fiona Thompson on 2/23/17.
//  Copyright © 2017 Fiona Thompson. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var composeMessageButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var messages: [PFObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ChatViewController.refresh), userInfo: nil, repeats: true)

        
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension

        // Do any additional setup after loading the view.
    }
    
    func refresh() {
        let query = PFQuery(className: "Message")
        query.includeKey("user")
        query.addDescendingOrder("createdAt")
        query.findObjectsInBackground { (messages: [PFObject]?, error: Error?) in
            if error == nil{
                self.messages = messages!
                self.tableView.reloadData()

            
            }else{
                print("\(error?.localizedDescription)")
                
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell") as! ChatCell
        cell.messageContent.text = messages[indexPath.row]["text"] as! String?
        if let user = messages[indexPath.row]["user"] as? PFUser{
            cell.username.text = user.username
        }else{
            cell.username.text = "Anon"
        }
        
        return cell
    }
    
    
    @IBAction func onSendMessagePressed(_ sender: Any) {
        let message = PFObject(className: "Message")
        message["text"] = messageTextField.text
        message["user"] = PFUser.current()
        message.saveInBackground { (succeeded:Bool, error: Error?) in
            if succeeded{
                print("Message has been saved.")
                self.messageTextField.text = ""
            }else {
                
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
