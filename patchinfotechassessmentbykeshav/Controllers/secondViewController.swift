//
//  secondViewController.swift
//  patchinfotechassessmentbykeshav
//
//  Created by keshav ujjainia on 13/04/21.
//

import UIKit

class secondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var items : [String] = ["Books", "Handicrafts", "Stationary items", "Home Decoration", "Smartphone Cases", "Home Essentials", "Craft items", "Fiction Books"]
    
    var sectionNumber = 0
    
    var dic : [String : String] = [
        
        "Books" : "24",
        "Handicrafts" : "No",
        "Stationary items" : "No",
        "Home Decoration" : "4",
        "Smartphone Cases" : "No",
        "Home Essentials" : "No",
        "Craft items" : "No",
        "Fiction Books" : "No"
    ]
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        categoryButton.layer.cornerRadius = 10
        
        
        //Segment color methods
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(named: "themeColor")!], for: UIControl.State.selected)
        
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
    }
    
    
    //Perform segue go back to first screen
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            performSegue(withIdentifier: "goBack", sender: self)
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    
    //MARK:- Category Table View Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.sectionNumber = section
        print("section : \(section)")
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
        cell.titleLabel.text = items[indexPath.section]
        cell.productDescription.text = dic[items[indexPath.section]]! + " products"

        if cell.productDescription.text == "No products" {
            cell.productImg.image = UIImage(named: "icons8-layers-30-2")
        }
        
        
        
        return cell
    }
    
}
