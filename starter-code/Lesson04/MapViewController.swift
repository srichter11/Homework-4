//
//  MapViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var textInputOne: UITextField!
    @IBOutlet weak var textInputTwo: UITextField!
    @IBOutlet weak var tableViewOutput: UITableView!
    var inputData: [String:String] = [:]

    @IBAction func textActionOne(sender: AnyObject) {
        inputData[textInputOne.text!] = ""
    }
    
    @IBAction func textActionTwo(sender: AnyObject) {
        inputData.updateValue(textInputTwo.text!, forKey: textInputOne.text!)
        tableViewOutput.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutput.dataSource = self
        tableViewOutput.delegate = self
        textInputOne.becomeFirstResponder()
    
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardIsShowing", name: UIKeyboardDidShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardIsHiding", name: UIKeyboardDidHideNotification, object: nil)
    }
    
    func keyboardIsShowing() {
       textInputOne.backgroundColor = UIColor.blueColor()
        textInputTwo.backgroundColor = UIColor.blueColor()
    }
    
    func keyboardIsHiding(){
        textInputOne.backgroundColor = UIColor.redColor()
        textInputTwo.backgroundColor = UIColor.redColor()    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let textOne = Array(self.inputData.keys)[indexPath.row]
        let textTwo = Array(self.inputData.values)[indexPath.row]
        cell.textLabel?.text = "\(textOne) - \(textTwo)"
        textInputOne.text = ""
        textInputTwo.text = ""
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inputData.count
    }
    
}
