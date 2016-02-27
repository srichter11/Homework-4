//
//  ViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ArrayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var listOuput: UITableView!
    
    var listItems = [String]()
    
    @IBAction func enterItem(sender: AnyObject) {
        listItems.append(inputTextField.text!)
        inputTextField.text = ""
        listOuput.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listOuput.dataSource = self
        listOuput.delegate = self
        inputTextField.becomeFirstResponder()
       
        self.dismissViewControllerAnimated(false, completion: nil)
        self.dismissViewControllerAnimated(false, completion: { () -> Void in
            self.view.backgroundColor = UIColor.blueColor()
        })
        self.view.backgroundColor = UIColor.redColor()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = listItems[indexPath.row]
            return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return listItems.count
    }
        
    
        
        
        
        
        /*
        TODO one: Add a table view AND a text input box to this view controller, either in code or via the storyboard. Accept keyboard input from the text view when the return key is pressed. Add the string that was entered into the text view into an array of strings (stored in this class).
        TODO two: Make this class a UITableViewDelegate and UITableViewDataSource that supply the above table view with cells. These cells should correspond to the text entered into the text box. E.g. If the text "one", then "two", then "three" was entered into the text box, there should be three cells in this table view that contain those strings in order.
        
        */
    
}

