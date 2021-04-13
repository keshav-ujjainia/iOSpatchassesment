//
//  ViewController.swift
//  patchinfotechassessmentbykeshav
//
//  Created by keshav ujjainia on 12/04/21.


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addProductButton: UIButton!
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.addProductButton.layer.cornerRadius = 10
        self.sortButton.layer.cornerRadius = 10
        tableView.delegate = self
        tableView.dataSource = self
      
        //Segment Color methods
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(named: "themeColor")!], for: UIControl.State.selected)
        
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
        
    }
    
    var categories : [String] = ["krill Communications", "Photo Frame by Ajanta Royal", "Balaji Telecom", "Apple", "Microsoft", "Amazon", "Nokia"]
    
    var dic = [
        "krill Communications" : "Fastrack Bare Basic Watch",
        "Photo Frame by Ajanta Royal" : "Synthetic Wood Photo Frame-Set",
        "Balaji Telecom" : "Telecommunication Pvt. Ltd.",
        "Apple" : "New iPhones Available",
        "Microsoft" : "Accessories Available",
        "Amazon" : "Deals of the day",
        "Nokia" : "Get in touch"
    ]
    
    var stocksNumber = ["Out of Stock", "45 in Stock", "Out of Stock", "Out of Stock", "45 in Stock", "45 in Stock", "45 in Stock", "Out of Stock"
    ]
    
    //Method to perform segue
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 1 {
            performSegue(withIdentifier: "goToCategory", sender: self)
        }
    }
    
    //MARK:- Table View Methods for Products
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath) as! TableViewCell
        cell.firstLabel.text = categories[indexPath.row]
        cell.secondLabel.text = dic[categories[indexPath.row]]
        cell.productImg.image = UIImage(named: "\(categories[indexPath.row])")
        cell.stockLabel.text = stocksNumber[indexPath.row]
        
        if stocksNumber[indexPath.row] == "Out of Stock" {
            cell.stockImg.image = UIImage(named: "icons8-red-circle-48")
        } else {
            cell.stockImg.image = UIImage(named: "icons8-green-circle-48")
        }
            return cell
    }

}

