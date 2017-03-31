//
//  DisplayViewController.swift
//  OCR_App
//
//  Created by Administrator on 02/09/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import CoreData

class DisplayTblViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    let moContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
//    var cell:TextCell!
    var txt = [Text]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {


////      let fetchRequest = NSFetchRequest(entityName:"Text")
      let request = NSFetchRequest(entityName:"Text")
      txt  = (try! moContext.executeFetchRequest(request)) as! [Text]
        NSLog("%@", txt)
        navigationItem.backBarButtonItem =  nil

        
            for t_txt in txt
            {
                print(t_txt.retreivedText)
//                txt.DisplayText.text = t_txt.retreivedText
            }
            self.tableView.reloadData()
    }

    //share button action
    @IBAction func ShareButton(sender: AnyObject)
    {
        
       
    }
        
        
  
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print(txt.count)
        return self.txt.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {

      let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TextCell
        
        
        let text = txt[indexPath.row]
        cell.DisplayText.text = text.retreivedText
        print(text.retreivedText)
        return cell
    }
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        switch editingStyle {
        case .Delete:
            // remove the deleted item from the model
            let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let context:NSManagedObjectContext = appDel.managedObjectContext
            context.deleteObject(txt[indexPath.row] )
            txt.removeAtIndex(indexPath.row)
            do {
                try context.save()
            } catch _ {
            }
            
            // remove the deleted item from the `UITableView`
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        default:
            return
        }
    }
    

    

}
